//
//  Photo.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct Photo: Codable {
    let id: String?
    let url: String?
    let thumbUrl: String?
    let user: User?
    let resId: Int?
    let caption: String?
    let timestamp: Int?
    let friendlyTime: String?
    let width: Int?
    let height: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case thumbUrl = "thumb_url"
        case user
        case resId = "res_id"
        case caption
        case timestamp
        case friendlyTime = "friendly_time"
        case width
        case height
    }
}
