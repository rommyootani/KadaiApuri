//
//  Configuration.swift
//  Amadeus
//
//  Created by Mehran on 3/30/1401 AP.
//

import Foundation

enum BaseURLType {
    case baseApi

    var desc: URL {
        switch self {
        case .baseApi:
            return URL("https://weather.tsukumijima.net/api")
        }
    }
}
