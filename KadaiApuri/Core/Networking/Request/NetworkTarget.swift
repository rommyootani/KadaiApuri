//
//  NetworkTarget.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

protocol NetworkTarget {
    var baseURL: BaseURLType { get }
    var path: String? { get }
    var methodType: HTTPMethod { get }
    var queryParams: [String: String]? { get }
    var queryParamsEncoding: URLEncoding? { get }
    var bodyEncoding: BodyEncoding? { get }
    var parameters: [String: Any]? { get }
    var cachePolicy: URLRequest.CachePolicy? { get }
    var timeoutInterval: TimeInterval? { get }
    var headers: [String: String]? { get }
}
