//
//  MockNetworkTarget.swift
//  EasyCryptoTests
//
//  Created by Mehran on 12/18/1401 AP.
//

import Foundation
@testable import KadaiApuri

class MockNetworkTarget: NetworkTarget {
    
    var baseURL: KadaiApuri.BaseURLType = .baseApi
    
    var path: String? = "/path"
    
    var methodType: KadaiApuri.HTTPMethod = .get
    
    var queryParams: [String : String]? = ["test": "test"]
    
    var queryParamsEncoding: KadaiApuri.URLEncoding? = .default
}
