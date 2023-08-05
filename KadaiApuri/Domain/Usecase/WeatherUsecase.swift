//
//  WeatherUseCase.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

protocol WeatherUsecaseProtocol: AnyObject {
    func execute(city: String) -> AnyPublisher<Weather?, APIError>
}

final class WeatherUseCase: WeatherUsecaseProtocol {

    private let weatherRepository: WeatherRepositoryProrocol
    var subscriber = Cancelable()

    init(weatherRepository: WeatherRepositoryProrocol = DIContainer.shared.inject(type: WeatherRepositoryProrocol.self)!) {
        self.weatherRepository = weatherRepository
    }

    func execute(city: String) -> AnyPublisher<Weather?, APIError> {
        self.weatherRepository.getWeather(city: city)
    }
}
