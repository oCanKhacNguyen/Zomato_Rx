//
//  FetchRestaurantsRequest.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

final class FetchRestaurantsRequest: BaseRequest {
    required init(count: Int) {
        let parameters: [String: Any] = ["count": count]
        super.init(url: Urls.basePath + "search", requestType: .get, parameters: parameters)
    }
}
