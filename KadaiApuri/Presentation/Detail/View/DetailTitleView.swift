//
//  DetailTitle.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 4/08/23.
//

import SwiftUI

struct DetailTitleView: View {
    enum Constant {
        static let lineLimit: Int = 3
    }
    var headline: String
    var text: String
    var body: some View {
        if !headline.isEmpty {
            Text(headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.title)
        } else {
            Text(Constants.Text.generalDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(FontManager.secondaryTitle)
        }
        Text(text.trimingAndFixingSpaces())
            .lineLimit(Constant.lineLimit)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(FontManager.body)
        Spacer()
    }
}
