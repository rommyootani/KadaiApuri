//
//  Constants.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

enum Constants {
    enum UbicationName {
        static let tokyo: String = "東京"
        static let chiba: String = "千葉"
        static let fuji: String = "富山"
        static let kyoto: String = "京都"
    }
    enum UbicationId {
        static let tokyo: String = "130010"
        static let chiba: String = "120010"
        static let fuji: String = "160010"
        static let kyoto: String = "260010"
    }
    enum Title {
        static let mainTitle: String = "課題アプリ"
        static let detailTitle: String = "課題アプリ"
    }
    enum PlaceHolder {
    }
    enum Picker {
        static let ubication: String = "地点"
    }
    enum Text {
        static let generalDescription: String = "概況"
        static let weather: String = "天気"
        static let max: String = "最高気温"
        static let min: String = "最低気温"
        static let celsius: String = "°C"
        static let informatonGet: String = "天気予報の取得"
        static let retry: String = "リトライ"
    }
    enum DateFormat {
        static let japanStandard: String = "yyyy年M月d日"
        static let standard: String = "yyyy-MM-dd"
    }
}
