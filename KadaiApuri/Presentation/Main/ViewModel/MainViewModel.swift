//
//  MainViewModel.swift
//  EasyCrypto
//
//  Created by Mehran on 11/15/1401 AP.
//

import Foundation
import Combine

protocol MainViewModelProtocol {
    func getTokyoData(city: Citys)
}

protocol DefaultMainViewModel: MainViewModelProtocol { }

final class MainViewModel: DefaultViewModel, DefaultMainViewModel {
    let title: String = Constants.Title.mainTitle
    private let weatherUsecase: WeatherUsecaseProtocol
    @Published private(set) var tokyoData: Weather?
    @Published private(set) var chibaData: Weather?
    @Published private(set) var fujiData: Weather?
    @Published private(set) var kyotoData: Weather?
    var navigateSubject = PassthroughSubject<MainView.Routes, Never>()
    init(weatherUsecase: WeatherUsecaseProtocol = DIContainer.shared.inject(type: WeatherUsecaseProtocol.self)!) {
        self.weatherUsecase = weatherUsecase
    }
}

extension MainViewModel: DataFlowProtocol {
    typealias InputType = Load
    enum Load {
        case onAppear
    }
    func apply(_ input: Load) {
        switch input {
        case .onAppear:
            self.bindData()
            self.callFirstTime()
        }
    }
    enum SortType {
        case rankASC
        case rankDSC
    }
    private func bindData() {
    }
    func callFirstTime() {
        self.getTokyoData()
        self.getChibaData()
        self.getFujiData()
        self.getKyotoData()
    }
    func getTokyoData(city: Citys = .tokyo) {
        self.callWithProgress(argument: self.weatherUsecase.execute(city: city.info.id)) { [ weak self] data in
            guard let data = data else {return}
            self?.tokyoData = data
        }
    }
    func getChibaData(city: Citys = .chiba) {
        self.callWithProgress(argument: self.weatherUsecase.execute(city: city.info.id)) { [ weak self] data in
            guard let data = data else {return}
            self?.chibaData = data
        }
    }
    func getFujiData(city: Citys = .fuji) {
        self.callWithProgress(argument: self.weatherUsecase.execute(city: city.info.id)) { [ weak self] data in
            guard let data = data else {return}
            self?.fujiData = data
        }
    }
    func getKyotoData(city: Citys = .kyoto) {
        self.callWithProgress(argument: self.weatherUsecase.execute(city: city.info.id)) { [ weak self] data in
            guard let data = data else {return}
            self?.kyotoData = data
        }
    }
}
