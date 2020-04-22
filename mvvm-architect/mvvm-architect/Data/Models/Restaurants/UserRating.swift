//
//  UserRating.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct UserRating: Codable {
    let aggregateRating: Int?
    let ratingText: String?
    let ratingColor: String?
    let ratingObj: RatingObj?
    let votes: Int?
    var customRatingText: String?
    var customRatingTextBackground: String?
    var ratingToolTip: String?

    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case ratingObj = "rating_obj"
        case votes
        case customRatingText = "custom_rating_text"
        case customRatingTextBackground = "custom_rating_text_background"
        case ratingToolTip = "rating_tool_tip"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        aggregateRating = (try? values.decode(Int.self, forKey: .aggregateRating)) ?? 0
        ratingText = (try? values.decode(String.self, forKey: .ratingText)) ?? ""
        ratingColor = (try? values.decode(String.self, forKey: .ratingColor)) ?? ""
        ratingObj = try? values.decode(RatingObj.self, forKey: .ratingObj)
        votes = (try? values.decode(Int.self, forKey: .votes)) ?? 0
        customRatingText = (try? values.decode(String.self, forKey: .customRatingText)) ?? ""
        customRatingTextBackground = (try? values.decode(String.self, forKey: .customRatingTextBackground)) ?? ""
        ratingToolTip = (try? values.decode(String.self, forKey: .ratingToolTip)) ?? ""
    }
}
