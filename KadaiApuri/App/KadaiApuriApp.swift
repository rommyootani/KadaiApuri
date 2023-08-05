//
//  KadaiApuriApp.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import SwiftUI

@main
struct KadaiApuriApp: App {
    init() {
        DIContainer.shared.registration()
    }
    var body: some Scene {
        WindowGroup {
            MainCoordinator(viewModel: MainViewModel())
        }
    }
}
