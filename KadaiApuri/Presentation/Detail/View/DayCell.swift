//
//  DayCell.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 4/08/23.
//

import SwiftUI

struct DayCell: View {
    enum Constant {
        static let nothing: String = "--"
        static let cellPadding: CGFloat = 20
    }
    var item: WeatherDay
    var body: some View {
        VStack {
            Text(item.date?.toDate() ?? Date(), formatter: itemFormatter)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.title)
            Spacer()
            Text(Constants.Text.weather)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.secondaryTitle)
            Text(item.telop ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.body)
            Spacer()
            Text(Constants.Text.max)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.secondaryTitle)
            Text("\(item.temperature?.max?.celsius ?? Constant.nothing)\(Constants.Text.celsius)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.body)
            Spacer()
            Text(Constants.Text.min)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.secondaryTitle)
            Text("\(item.temperature?.min?.celsius ?? Constant.nothing)\(Constants.Text.celsius)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.body)
        }
        .padding(Constant.cellPadding)
        .border(.black)
    }
}
