//
//  RestaurantsRepositories.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

protocol RestaurantsRepository {
    func fetchRestaurants() -> Observable<[Restaurants]>
    func fetchRestaurantDetail(resId: String) -> Observable<RestaurantDetail>
}

final class RestaurantsRepositoryImpl: RestaurantsRepository {
    private var api: APIService?

    required init(api: APIService = APIService.shared) {
        self.api = api
    }

    func fetchRestaurants() -> Observable<[Restaurants]> {
        return Observable.create { observer in
            let input = FetchRestaurantsRequest(count: 10)
            let request = self.api?.request(input: input) { (object: ListRestaurants?, error) in
                if let object = object {
                    guard let restaurants = object.restaurants else { return }
                    observer.onNext(restaurants)
                    observer.onCompleted()
                } else if let error = error {
                    observer.onError(error)
                }
            }

            return Disposables.create {
                request?.cancel()
            }
        }
    }

    func fetchRestaurantDetail(resId: String) -> Observable<RestaurantDetail> {
        return Observable.create { observer in
            let input = FetchResDetailRequest(resId: resId)
            let request = self.api?.request(input: input) { (object: RestaurantDetail?, error) in
                if let restaurant = object {
//                    guard let restaurant = object else { return }
                    observer.onNext(restaurant)
                    observer.onCompleted()
                } else if let error = error {
                    observer.onError(error)
                }
            }

            return Disposables.create {
                request?.cancel()
            }
        }
    }
}
