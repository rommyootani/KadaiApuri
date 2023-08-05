//
//  AppDependencyContainer.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

protocol DIContainerProtocol {
  func register<Service>(type: Service.Type, component: Any)
  func inject<Service>(type: Service.Type) -> Service?
}

final class DIContainer: DIContainerProtocol {

  static let shared = DIContainer()

  private init() {}

  var services: [String: Any] = [:]

    func register<Service>(type: Service.Type, component service: Any) {
      services["\(type)"] = service
  }

  func inject<Service>(type: Service.Type) -> Service? {
    return services["\(type)"] as? Service
  }
}
