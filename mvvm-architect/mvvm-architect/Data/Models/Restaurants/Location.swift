//
//  Location.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct Location: Codable {
    let address: String?
    let locality: String?
    let city: String?
    let cityId: Int?
    let latitude: String?
    let longitude: String?
    let zipcode: String?
    let countryId: Int?
    let localityVerbose: String?

    enum CodingKeys: String, CodingKey {
        case address
        case locality
        case city
        case cityId = "city_id"
        case latitude
        case longitude
        case zipcode
        case countryId = "country_id"
        case localityVerbose = "locality_verbose"
    }
}
