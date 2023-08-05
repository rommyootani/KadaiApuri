//
//  DetailViewModel.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {

    let title: String = Constants.Title.detailTitle
    init() {
    }
}

extension DetailViewModel: DataFlowProtocol {
    typealias InputType = Load
    enum Load {
        case onAppear
    }
    func apply(_ input: Load) {
        switch input {
        case .onAppear:
            self.bindData()
        }
    }
    private func bindData() {
    }
}
