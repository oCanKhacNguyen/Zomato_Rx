//
//  CustomRequestAdapter.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

final class CustomRequestAdapter: RequestInterceptor {
    // MARK: Setting request adapter

    func adapt(_ urlRequest: URLRequest, for _: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.setValue(APIKey.apiKey, forHTTPHeaderField: "user-key")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        completion(.success(urlRequest))
    }
}
