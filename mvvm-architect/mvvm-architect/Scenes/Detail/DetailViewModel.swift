//
//  DetailViewModel.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/21/20.
//  Copyright © 2020 sun. All rights reserved.
//

final class DetailViewModel: ViewModelType {
    struct Input {
        let ready: Driver<Void>
    }

    struct Output {
        let data: Driver<RestaurantDetail?>
    }

    struct Dependencies {
        let id: String
        let api: RestaurantsRepositoryImpl
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func transform(input: DetailViewModel.Input) -> DetailViewModel.Output {
        let data = input.ready
            .asObservable()
            .flatMap { _ in
                self.dependencies.api.fetchRestaurantDetail(resId: self.dependencies.id)
            }
            .map { restaurant -> RestaurantDetail? in
                restaurant
            }
            .asDriver(onErrorJustReturn: nil)

        return Output(data: data)
    }
}
