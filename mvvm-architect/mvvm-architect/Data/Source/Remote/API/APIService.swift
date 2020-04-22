//
//  APIService.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/20/20.
//  Copyright © 2020 sun. All rights reserved.
//

import Alamofire

final class APIService {
    static let shared = APIService()

    private var alamoFireManager = Session.default

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamoFireManager = Session(configuration: configuration, interceptor: CustomRequestAdapter())
    }

    func request<T: Decodable>(input: BaseRequest, completion: @escaping (_ value: T?, _ error: BaseError?) -> Void) -> DataRequest {
        return alamoFireManager.request(input.url,
                                        method: input.requestType,
                                        parameters: input.parameters,
                                        encoding: input.encoding)
            .validate(statusCode: 200 ..< 512)
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        if let statusCode = response.response?.statusCode {
                            if statusCode == 200 {
                                print("========== Success code: [\(statusCode)] - \(input.url)")
                                guard let responseData = response.data else { return }
                                let object = try JSONDecoder().decode(T.self, from: responseData)
                                completion(object, nil)
                            } else {
                                print("========== Error code: [\(statusCode)] - \(input.url)")
                                completion(nil, BaseError.httpError(httpCode: statusCode))
                            }
                        } else {
                            completion(nil, BaseError.unexpectedError)
                        }
                    } catch {
                        print("========== Error description: \(error.localizedDescription)")
                        completion(nil, BaseError.apiFailure)
                    }
                case .failure:
                    completion(nil, BaseError.networkError)
                }
            }
    }
}
