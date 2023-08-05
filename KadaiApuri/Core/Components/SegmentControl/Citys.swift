//
//  Citys.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import Foundation

enum Citys: String, CaseIterable {

    case tokyo
    case chiba
    case fuji
    case kyoto
    var info: (id: String, description: String) {
        switch self {
        case .tokyo:
            return (Constants.UbicationId.tokyo, Constants.UbicationName.tokyo)
        case .chiba:
            return (Constants.UbicationId.chiba, Constants.UbicationName.chiba)
        case .fuji:
            return (Constants.UbicationId.fuji, Constants.UbicationName.fuji)
        case .kyoto:
            return (Constants.UbicationId.kyoto, Constants.UbicationName.kyoto)
        }
    }
}
