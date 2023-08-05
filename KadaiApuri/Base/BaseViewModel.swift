//
//  BaseViewModel.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

enum ViewModelStatus: Equatable {
    case loadStart
    case dismissAlert
    case emptyStateHandler(title: String, isShow: Bool)
}

protocol BaseViewModelEventSource: AnyObject {
    var loadinState: CurrentValueSubject<ViewModelStatus, Never> { get }
}

protocol ViewModelService: AnyObject {
    func callWithProgress<ReturnType>(argument: AnyPublisher<ReturnType?,
                                      APIError>,
                                      callback: @escaping (_ data: ReturnType?) -> Void)
    func callWithoutProgress<ReturnType>(argument: AnyPublisher<ReturnType?,
                                         APIError>,
                                         callback: @escaping (_ data: ReturnType?) -> Void)
}

typealias BaseViewModel = BaseViewModelEventSource & ViewModelService

open class DefaultViewModel: BaseViewModel, ObservableObject {

    var loadinState = CurrentValueSubject<ViewModelStatus, Never>(.dismissAlert)
    let subscriber = Cancelable()

    func callWithProgress<ReturnType>(argument: AnyPublisher<ReturnType?,
                                      APIError>,
                                      callback: @escaping (_ data: ReturnType?) -> Void) {
        self.loadinState.send(.loadStart)

        let completionHandler: (Subscribers.Completion<APIError>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.loadinState.send(.dismissAlert)
                self?.loadinState.send(.emptyStateHandler(title: error.desc, isShow: true))
            case .finished:
                self?.loadinState.send(.dismissAlert)
            }
        }

        let resultValueHandler: (ReturnType?) -> Void = { data in
            callback(data)
        }

        argument
            .subscribe(on: WorkScheduler.backgroundWorkScheduler)
            .receive(on: WorkScheduler.mainScheduler)
            .sink(receiveCompletion: completionHandler, receiveValue: resultValueHandler)
            .store(in: subscriber)
    }

    func callWithoutProgress<ReturnType>(argument: AnyPublisher<ReturnType?,
                                         APIError>,
                                         callback: @escaping (_ data: ReturnType?) -> Void) {

        let resultValueHandler: (ReturnType?) -> Void = { data in
            callback(data)
        }

        argument
            .subscribe(on: WorkScheduler.backgroundWorkScheduler)
            .receive(on: WorkScheduler.mainScheduler)
            .sink(receiveCompletion: {_ in }, receiveValue: resultValueHandler)
            .store(in: subscriber)
    }
}
