//
//  HTTPURLResponse + Extension.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

extension HTTPURLResponse {
    var isResponseOK: Bool {
        return (200..<299).contains(statusCode)
    }
}
