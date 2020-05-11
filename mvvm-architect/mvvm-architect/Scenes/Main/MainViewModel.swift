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
        let refreshing: Driver<Void>
        let selected: Driver<IndexPath>
    }

    struct Output {
        let loading: Driver<Bool>
        let results: Driver<[Restaurants]>
        let selected: Driver<Void>
        let error: Driver<Error>
    }

    struct Dependencies {
        let api: RestaurantsRepository
        let count: Int
        let navigator: MainNavigatable
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()
        let errorTracker = ErrorTracker()

        let results = Observable.of(input.ready, input.refreshing)
            .merge()
            .flatMapLatest { _ in
                self.dependencies.api.fetchRestaurants(self.dependencies.count)
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
            }
            .map { listRestaurants -> [Restaurants] in
                listRestaurants.restaurants ?? []
            }
            .asDriverOnErrorJustComplete()

        let errors = errorTracker.asDriver()

        let selected = input.selected
            .asObservable()
            .withLatestFrom(results) { ($0, $1) }
            .do(onNext: { [weak self] (indexPath: IndexPath, restaurants: [Restaurants]) in
                guard let self = self,
                    let resId = restaurants[indexPath.row].restaurant?.id else { return }
                self.dependencies.navigator.navigateToDetailScreen(with: resId, api: self.dependencies.api)
            })
            .mapToVoid()
            .asDriverOnErrorJustComplete()

        return Output(loading: loading, results: results, selected: selected, error: errors)
    }
}
