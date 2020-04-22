//
//  MainViewModel.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/20/20.
//  Copyright © 2020 sun. All rights reserved.
//

final class MainViewModel: ViewModelType {
    struct Input {
        let ready: Driver<Void>
        let selected: Driver<Int>
    }

    struct Output {
        let loading: Driver<Bool>
        let results: Driver<[Restaurants]?>
        let selected: Driver<Void>
        let error: Driver<Error>
    }

    struct Dependencies {
        let api: RestaurantsRepositoryImpl
        let navigator: MainNavigatable
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func transform(input: MainViewModel.Input) -> MainViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()
        let errorTracker = ErrorTracker()

        let results = input.ready
            .asObservable()
            .flatMapLatest { _ in
                self.dependencies.api.fetchRestaurants()
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
            }
            .map { restaurants -> [Restaurants]? in
                restaurants
            }
            .asDriver(onErrorJustReturn: nil)

        let errors = errorTracker.asDriver()

        let selected = input.selected
            .asObservable()
            .withLatestFrom(results) { ($0, $1) }
            .do(onNext: { [weak self] (index: Int, restaurants: [Restaurants]?) in
                guard let self = self,
                    let resId = restaurants?[index].restaurant?.id else { return }
                self.dependencies.navigator.navigateToDetailScreen(with: resId, api: self.dependencies.api)
            })
            .map { _ in () }
            .asDriver(onErrorJustReturn: ())

        return Output(loading: loading, results: results, selected: selected, error: errors)
    }
}
