//
//  FetchCategoriesRequest.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/20/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

final class FetchCategoriesRequest: BaseRequest {
    required init() {
        super.init(url: Urls.basePath + "categories", requestType: .get)
    }
}
