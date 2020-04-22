//
//  ListRestaurants.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/20/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct ListRestaurants: Codable {
    let resultsFound: Int?
    let resultsStart: Int?
    let resultsShown: Int?
    let restaurants: [Restaurants]?

    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants
    }
}
