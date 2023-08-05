//
//  URL + Extension.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}
