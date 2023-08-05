//
//  AppDependencyContainer + Injection.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

extension DIContainer {
    func registration() {
        // Weather
        register(type: WeatherRemoteProtocol.self, component: WeatherRemote())
        register(type: WeatherRepositoryProrocol.self, component: WeatherRepository())
        register(type: WeatherUsecaseProtocol.self, component: WeatherUseCase())
    }
}
