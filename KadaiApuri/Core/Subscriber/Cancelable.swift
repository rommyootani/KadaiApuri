//
//  Cancelable.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Combine

final class Cancelable {

    fileprivate(set) var subscriptions = Set<AnyCancellable>()

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in subscriber: Cancelable) {
        subscriber.subscriptions.insert(self)
    }
}
