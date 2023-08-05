//
//  MainCoordinator.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import SwiftUI
import Combine

struct MainCoordinator: CoordinatorProtocol {
    @StateObject var viewModel: MainViewModel
    @State var activeRoute: Destination? = Destination(route: .first(item: Weather()))
    @State var transition: Transition?
    @State private var isLoaded: Bool = Bool()
    let subscriber = Cancelable()
    var body: some View {
        mainView
            .route(to: $activeRoute)
            .navigation()
            .onAppear {
                self.mainView.viewModel.navigateSubject
                    .sink { route in
                        activeRoute = Destination(route: route)
                    }.store(in: subscriber)
            }
    }
    var mainView: MainView {
        return MainView(viewModel: viewModel)
    }
}

extension MainCoordinator {
    struct Destination: DestinationProtocol {
        var route: MainView.Routes
        @ViewBuilder
        var content: some View {
            switch route {
            case .first(let item):
                DetailView(item: item)
            }
        }
        var transition: Transition {
            switch route {
            case .first: return .push
            }
        }
    }
}
