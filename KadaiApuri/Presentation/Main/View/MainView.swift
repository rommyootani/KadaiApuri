//
//  MainView.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import SwiftUI
import Combine

struct MainView: Coordinatable {
    typealias Route = Routes
    @ObservedObject private(set) var viewModel: MainViewModel
    enum Constant {
        static let principalPadding: CGFloat = 16
    }
    @State var tabIndex = 0
    @State private var shouldShowDropdown = false
    @State private var selectedCity: Citys = .tokyo
    @State private var isLoading: Bool = false
    @State private var presentAlert = true
    @State private var alertMesagee: String = ""
    let subscriber = Cancelable()
    init(viewModel: MainViewModel = DIContainer.shared.inject(type: MainViewModel.self)!) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SegmentControl($selectedCity)
                    Spacer()
                    dayList(city: selectedCity)
                }
                if !presentAlert {
                    self.showAlert(Constants.Text.informatonGet, Constants.Text.retry)
                }
            }
            .padding(Constant.principalPadding)
            .onViewDidLoad {
                self.viewModel.apply(.onAppear)
            }
        }
        .onAppear(perform: handleState)
    }
    private func dayList(city: Citys) -> some View {
        VStack {
            switch city {
            case .tokyo:
                tokyoDetailView()
            case .chiba:
                chibaDetailView()
            case .fuji:
                fujiDetailView()
            case .kyoto:
                kyotoDetailView()
            }
        }
        .padding()
    }
    private func tokyoDetailView() -> some View {
        VStack {
            if viewModel.tokyoData != nil {
                DetailView(item: viewModel.tokyoData!)
            }
        }
    }
    private func chibaDetailView() -> some View {
        VStack {
            if viewModel.chibaData != nil {
                DetailView(item: viewModel.chibaData!)
            }
        }
    }
    private func fujiDetailView() -> some View {
        VStack {
            if viewModel.fujiData != nil {
                DetailView(item: viewModel.fujiData!)
            }
        }
    }
    private func kyotoDetailView() -> some View {
        VStack {
            if viewModel.kyotoData != nil {
                DetailView(item: viewModel.kyotoData!)
            }
        }
    }
}

extension MainView {
    private func handleState() {
        self.viewModel.loadinState
            .receive(on: WorkScheduler.mainThread)
            .sink { state in
                switch state {
                case .loadStart:
                    self.isLoading = true
                case .dismissAlert:
                    self.isLoading = false
                case .emptyStateHandler(let message, _):
                    self.isLoading = false
                    self.presentAlert = false
                    self.alertMesagee = message
                }
            }.store(in: subscriber)
    }
}

extension MainView {
    func showAlert(_ title: String, _ message: String) -> some View {
        CustomAlertView(title: title, primaryButtonLabel: message, primaryButtonAction: {
            self.presentAlert = true
            self.viewModel.callFirstTime()
        })
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

extension MainView {
    enum Routes: Routing {
        case first(item: Weather)
    }
}
#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
#endif
