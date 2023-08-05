//
//  WeatherRepository.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

protocol WeatherRepositoryProrocol {
    func getWeather(city: String) -> AnyPublisher<Weather?, APIError>
}

final class WeatherRepository {

    private let service: WeatherRemoteProtocol

    init(service: WeatherRemoteProtocol = DIContainer.shared.inject(type: WeatherRemoteProtocol.self)!) {
        self.service = service
    }
}

extension WeatherRepository: WeatherRepositoryProrocol {
    func getWeather(city: String) -> AnyPublisher<Weather?, APIError> {
        return self.service.fetch(city: city)
    }
}
