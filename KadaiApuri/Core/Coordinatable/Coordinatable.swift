//
//  Coordinatable.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import SwiftUI

// implemented by routes enum inside each view
protocol Routing: Equatable {}

// implemented by the view that has routes
protocol Coordinatable: View {
  associatedtype Route: Routing
}
