//
//  FakeEndpoint.swift
//  EasyCryptoTests
//
//  Created by Mehran on 12/18/1401 AP.
//

import Foundation
@testable import KadaiApuri

final class DummyTarget: NetworkTarget {
    var baseURL: KadaiApuri.BaseURLType = .baseApi
    
    var path: String? = "test/test"
    
    var methodType: KadaiApuri.HTTPMethod = .get
    
    var queryParams: [String : String]? = ["item": "item"]
    
    var queryParamsEncoding: KadaiApuri.URLEncoding? = .default
}
