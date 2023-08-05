//
//  WeatherRemoteMock.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import Foundation
import Combine
@testable import KadaiApuri

final class WeatherRemoteMock: WeatherRemoteProtocol {
    var fetchedResult: AnyPublisher <KadaiApuri.Weather?, KadaiApuri.APIError>!
    func fetch(city: String) -> AnyPublisher<KadaiApuri.Weather?, KadaiApuri.APIError> {
        return fetchedResult
    }
}
