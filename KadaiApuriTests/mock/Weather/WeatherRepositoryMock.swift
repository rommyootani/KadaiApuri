//
//  WeatherRepositoryMock.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import Foundation
import Combine
@testable import KadaiApuri

final class WeatherRepositoryMock: KadaiApuri.WeatherRepositoryProrocol {
    let mockWeatherService = WeatherRemoteMock()
    func getWeather(city: String) -> AnyPublisher<KadaiApuri.Weather?, KadaiApuri.APIError> {
        return mockWeatherService.fetchedResult
    }
}
