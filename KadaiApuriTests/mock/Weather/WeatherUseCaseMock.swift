//
//  WeatherUseCaseMock.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import Foundation
import Combine
@testable import KadaiApuri

final class WeatherUseCaseMock: KadaiApuri.WeatherUsecaseProtocol {
    let mockWeatherRepisitory = WeatherRepositoryMock()
    func execute(city: String) -> AnyPublisher<KadaiApuri.Weather?, KadaiApuri.APIError> {
        return mockWeatherRepisitory.getWeather(city: city)
    }
}
