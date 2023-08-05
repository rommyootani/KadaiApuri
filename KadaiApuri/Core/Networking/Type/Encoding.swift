//
//  Encoding.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

public enum URLEncoding: String {
    // Generally for these methods - GET, HEAD, DELETE, CONNECT, OPTIONS
    case `default`
    case percentEncoded
    // Always for POST/PUT METHOD
    case xWWWFormURLEncoded = "application/x-www-form-urlencoded"
}

public enum BodyEncoding: String {
    case JSON
    case xWWWFormURLEncoded = "application/x-www-form-urlencoded"
}
