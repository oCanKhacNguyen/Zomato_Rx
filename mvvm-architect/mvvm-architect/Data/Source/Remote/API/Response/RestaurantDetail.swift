//
//  RestaurantDetail.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct RestaurantDetail: Codable {
    let restaurantInfo: RestaurantInfo?
    let id: String?
    let name: String?
    let url: String?
    let location: Location?
    let switchToOrderMenu: Int?
    let cuisines: String?
    let timings: String?
    let averageCostForTwo: Int?
    let priceRange: Int?
    let currency: String?
    let highlights: [String]?
    let offers: [String]?
    let opentableSupport: Int?
    let isZomatoBookRes: Int?
    let mezzoProvider: String?
    let isBookFormWebView: Int?
    let bookFormWebViewUrl: String?
    let bookAgainUrl: String?
    let thumb: String?
    let userRating: UserRating?
    let allReviewsCount: Int?
    let photosUrl: String?
    let photoCount: Int?
    let photos: [Photos]?
    let menuUrl: String?
    let featuredImage: String?
    let hasOnlineDelivery: Int?
    let isDeliveringNow: Int?
    let storeType: String?
    let includeBogoOffers: Bool
    let deeplink: String?
    let isTableReservationSupported: Int?
    let hasTableBooking: Int?
    let eventsUrl: String?
    let phoneNumbers: String?
    let allReviews: AllReviews?
    let establishment: [String]?

    enum CodingKeys: String, CodingKey {
        case restaurantInfo = "R"
        case id
        case name
        case url
        case location
        case switchToOrderMenu = "switch_to_order_menu"
        case cuisines
        case timings
        case averageCostForTwo = "average_cost_for_two"
        case priceRange = "price_range"
        case currency
        case highlights
        case offers
        case opentableSupport = "opentable_support"
        case isZomatoBookRes = "is_zomato_book_res"
        case mezzoProvider = "mezzo_provider"
        case isBookFormWebView = "is_book_form_web_view"
        case bookFormWebViewUrl = "book_form_web_view_url"
        case bookAgainUrl = "book_again_url"
        case thumb
        case userRating = "user_rating"
        case allReviewsCount = "all_reviews_count"
        case photosUrl = "photos_url"
        case photoCount = "photo_count"
        case photos
        case menuUrl = "menu_url"
        case featuredImage = "featured_image"
        case hasOnlineDelivery = "has_online_delivery"
        case isDeliveringNow = "is_delivering_now"
        case storeType = "store_type"
        case includeBogoOffers = "include_bogo_offers"
        case deeplink
        case isTableReservationSupported = "is_table_reservation_supported"
        case hasTableBooking = "has_table_booking"
        case eventsUrl = "events_url"
        case phoneNumbers = "phone_numbers"
        case allReviews = "all_reviews"
        case establishment
    }
}
