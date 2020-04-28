//
//  RestaurantsRepositories.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

protocol RestaurantsRepository {
    func fetchRestaurants() -> Observable<ListRestaurants>
    func fetchRestaurantDetail(resId: String) -> Observable<RestaurantDetail>
}

final class RestaurantsRepositoryImpl: RestaurantsRepository {
    private var api: APIService?

    required init(api: APIService = APIService.shared) {
        self.api = api
    }

    func fetchRestaurants() -> Observable<ListRestaurants> {
        let input = FetchRestaurantsRequest(count: 10)
        return api?.request(input: input) ?? Observable.empty()
    }

    func fetchRestaurantDetail(resId: String) -> Observable<RestaurantDetail> {
        let input = FetchResDetailRequest(resId: resId)
        return api?.request(input: input) ?? Observable.empty()
    }
}
