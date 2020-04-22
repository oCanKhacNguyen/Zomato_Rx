//
//  User.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct User: Codable {
    let name: String?
    let foodieColor: String?
    let profileUrl: String?
    let profileImage: String?
    let profileDeeplink: String?

    enum CodingKeys: String, CodingKey {
        case name
        case foodieColor = "foodie_color"
        case profileUrl = "profile_url"
        case profileImage = "profile_image"
        case profileDeeplink = "profile_deeplink"
    }
}
