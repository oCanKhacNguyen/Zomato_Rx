//
//  BaseRequest.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

typealias JsonDictionary = [String: Any]

class BaseRequest {
    var url: String = ""
    var requestType: HTTPMethod = .get
    var parameters: JsonDictionary?

    init(url: String) {
        self.url = url
    }

    init(url: String, requestType: HTTPMethod) {
        self.url = url
        self.requestType = requestType
    }

    init(url: String, requestType: HTTPMethod, parameters: JsonDictionary?) {
        self.url = url
        self.requestType = requestType
        self.parameters = parameters
    }

    // For GET, HEAD, and DELETE requests, URLEncoding.default encodes the parameters as a query string and adds it to the URL
    // For any other method (such as POST), JSONEncoding.default encodes the parameters as a query string and sent as the body of the HTTP request.

    var encoding: ParameterEncoding {
        switch requestType {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
