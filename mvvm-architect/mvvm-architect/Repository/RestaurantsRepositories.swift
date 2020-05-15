//
//  RestaurantsRepositories.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

protocol RestaurantsRepository {
    func fetchRestaurants() -> Observable<PagingInfo<ListRestaurants>>
    func fetchRestaurants(start: Int, count: Int) -> Observable<PagingInfo<ListRestaurants>>
    func fetchRestaurantDetail(with resId: String) -> Observable<RestaurantDetail>
}

final class RestaurantsRepositoryImpl: RestaurantsRepository {
    private let api: APIService

    required init(_ api: APIService) {
        self.api = api
    }

    func fetchRestaurants() -> Observable<PagingInfo<ListRestaurants>> {
        let router = APIRouter.search(start: 0)
        return api.request(router: router).asObservable()
    }

    func fetchRestaurants(start: Int, count _: Int) -> Observable<PagingInfo<ListRestaurants>> {
        let router = APIRouter.search(start: start)
        return api.request(router: router)
    }

    func fetchRestaurantDetail(with resId: String) -> Observable<RestaurantDetail> {
        let router = APIRouter.fetchResDetail(resId: resId)
        return api.request(router: router).asObservable()
    }
}
