//
//  DataFlowProtocol.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

protocol DataFlowProtocol {
    associatedtype InputType
    func apply(_ input: InputType)
}
