//
//  RestaurantsRepositories.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

protocol RestaurantsRepository {
    func fetchRestaurants(_ count: Int) -> Single<ListRestaurants>
    func fetchRestaurantDetail(with resId: String) -> Single<RestaurantDetail>
}

final class RestaurantsRepositoryImpl: RestaurantsRepository {
    private let api: APIService

    required init(_ api: APIService) {
        self.api = api
    }

    func fetchRestaurants(_ count: Int) -> Single<ListRestaurants> {
        let router = APIRouter.search(count: count)
        return api.request(router: router)
    }

    func fetchRestaurantDetail(with resId: String) -> Single<RestaurantDetail> {
        let router = APIRouter.fetchResDetail(resId: resId)
        return api.request(router: router)
    }
}
