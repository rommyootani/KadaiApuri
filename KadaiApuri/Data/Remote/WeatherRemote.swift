//
//  WeatherRemote.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

protocol WeatherRemoteProtocol: AnyObject {
     func fetch(city: String) -> AnyPublisher<Weather?, APIError>
}

final class WeatherRemote: NetworkClientManager<HttpRequest>, WeatherRemoteProtocol {
    func fetch(city: String) -> AnyPublisher<Weather?, APIError> {
        self.request(request: HttpRequest(request: WeatherRequest(city: city)),
                     scheduler: WorkScheduler.mainScheduler,
                     responseObject: Weather?.self)
    }
}

struct WeatherRequest: NetworkTarget {

    let city: String

    init(city: String
        ) {
        self.city = city
    }

    var baseURL: BaseURLType {
        return .baseApi
    }

    var path: String? {
        return "/forecast"
    }

    var methodType: HTTPMethod {
        .get
    }

    var queryParams: [String: String]? {
        return ["city": city]
    }

    var queryParamsEncoding: URLEncoding? {
        return .default
    }
}
