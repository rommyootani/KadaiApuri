//
//  NetworkType + Default.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

extension NetworkTarget {

    var bodyEncoding: BodyEncoding? {
        return nil
    }

    var parameters: [String: Any]? {
       return nil
    }

    var cachePolicy: URLRequest.CachePolicy? {
        return .useProtocolCachePolicy
    }

    var timeoutInterval: TimeInterval? {
        return 20.0
    }

    var headers: [String: String]? {
        ["accept": "application/json"]
    }
}
