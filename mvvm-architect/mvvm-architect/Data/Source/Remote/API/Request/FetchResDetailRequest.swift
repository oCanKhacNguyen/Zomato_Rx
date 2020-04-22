//
//  FetchResDetailRequest.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/22/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

final class FetchResDetailRequest: BaseRequest {
    required init(resId: String) {
        let parameters: [String: Any] = ["res_id": resId]
        super.init(url: Urls.basePath + "restaurant", requestType: .get, parameters: parameters)
    }
}
