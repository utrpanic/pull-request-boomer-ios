//
//  API.swift
//  Model
//
//  Created by box-jeon-mac-mini on 2020/01/19.
//  Copyright © 2020 utrpanic. All rights reserved.
//

import Foundation

import Alamofire
import AnyCodable

typealias RawResponse = [String: AnyDecodable]

typealias APICompletion<T> = (T) -> Void

class NetworkAPI {
    
    private func headers() -> HTTPHeaders {
        var headers = HTTPHeaders()
        return headers
    }
    
    func get(_ URL: URLConvertible, showLog: Bool) {
        let method: HTTPMethod = .get
        let request = Alamofire.request(URL, method: method, parameters: nil, encoding: URLEncoding.default, headers: self.headers())
        request.log(showLog)
        request.responseJSON { (response) -> Void in
            response.log(showLog)
            switch response.result {
            case let .success(data):
                break
            case let .failure(error):
                break
            }
        }
    }
}

private extension Request {
    
    func log(_ on: Bool) {
        #if DEBUG
        if on {
            debugPrint(self)
        }
        #endif
    }
}

private extension DataResponse {
    
    func log(_ on: Bool) {
        #if DEBUG
        if on {
            debugPrint(self)
        }
        #endif
    }
}
