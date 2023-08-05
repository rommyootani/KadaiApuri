//
//  SegmentControl.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import SwiftUI

struct SegmentControl: View {
    var title: String?
    var cityCode: String?
    @Binding var selectedCity: Citys

    init(_ selectedCity: Binding<Citys>) {
        self._selectedCity = selectedCity
    }
    var body: some View {
        Picker(Constants.Picker.ubication, selection: $selectedCity) {
            ForEach(Citys.allCases, id: \.self) { city in
                Text(city.info.description).tag(city)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}
