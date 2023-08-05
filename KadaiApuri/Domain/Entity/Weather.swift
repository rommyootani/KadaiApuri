//
//  Weather.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 3/08/23.
//

import Foundation

struct Weather: Decodable {
    var publicTime, publicTimeFormatted, publishingOffice, title, link: String?
    var description: WeatherDescription?
    var forecasts: [WeatherDay]?
    var location: WeatherLocation?
    var copyright: WeatherCopyright?

    enum CodingKeys: String, CodingKey {
        case publicTime
        case publicTimeFormatted
        case publishingOffice
        case title
        case link
        case description
        case forecasts
        case location
        case copyright
    }
}

extension Weather: Equatable {
    static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.title == rhs.title
    }
}

struct WeatherDescription: Decodable {
    var publicTime, publicTimeFormatted, headlineText, bodyText, text: String?
    enum CodingKeys: String, CodingKey {
        case publicTime
        case publicTimeFormatted
        case headlineText
        case bodyText
        case text
    }
}

struct WeatherDay: Decodable, Hashable {
    var date, dateLabel, telop: String?
    var detail: DaysDetail?
    var temperature: DaysTemperature?
    var chanceOfRain: DaysChanceOfRain?
    var image: DaysImage?
    enum CodingKeys: String, CodingKey {
        case date
        case dateLabel
        case telop
        case detail
        case temperature
        case chanceOfRain
        case image
    }
}

extension WeatherDay: Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(dateLabel)
    }
    static func == (lhs: WeatherDay, rhs: WeatherDay) -> Bool {
        return lhs.dateLabel == rhs.dateLabel
    }
}

struct DaysDetail: Decodable {
    var weather, wind, wave: String?
    enum CodingKeys: String, CodingKey {
        case weather
        case wind
        case wave
    }
}

struct DaysTemperature: Decodable {
    var min, max: TemperatureDetail?
    enum CodingKeys: String, CodingKey {
        case min
        case max
    }
}

struct TemperatureDetail: Decodable {
    var celsius, fahrenheit: String?
    enum CodingKeys: String, CodingKey {
        case celsius
        case fahrenheit
    }
}

struct DaysChanceOfRain: Decodable {
    var tZeroToSix, tSixToTwelve, tTwelveToEighteen, tEighteenToTwentyFour: String?
    enum CodingKeys: String, CodingKey {
        case tZeroToSix = "T00_06"
        case tSixToTwelve = "T06_12"
        case tTwelveToEighteen = "T12_18"
        case tEighteenToTwentyFour = "T18_24"
    }
}

struct DaysImage: Decodable {
    var title, url: String?
    var width, height: Int?
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case width
        case height
    }
}

struct WeatherLocation: Decodable {
    var area, prefecture, district, city: String?
    var image: CopyrightImage?
    var provider: CopyrightProvider?
    enum CodingKeys: String, CodingKey {
        case area
        case prefecture
        case district
        case city
    }
}

struct WeatherCopyright: Decodable {
    var title, link: String?
    var image: CopyrightImage?
    var provider: [CopyrightProvider?]?
    enum CodingKeys: String, CodingKey {
        case title
        case link
    }
}

struct CopyrightImage: Decodable {
    var title, link, url: String?
    var width, height: Int?
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case url
        case width
        case height
    }
}

struct CopyrightProvider: Decodable {
    var link, name, note: String?
    enum CodingKeys: String, CodingKey {
        case link
        case name
        case note
    }
}

extension Weather {
    private static let mockDescription = WeatherDescription.init(publicTime: "2023-08-04T16:44:00+09:00", publicTimeFormatted: "2023/08/04 16:44:00", headlineText: "", bodyText: "　関東甲信地方は、高気圧に緩やかに覆われていますが、上空の寒気や湿った空気の影響を受けている所があります。\n\n　東京地方は、晴れや曇りとなっています。\n\n　４日は、高気圧に緩やかに覆われますが、上空の寒気や湿った空気の影響を受ける見込みです。", text: "　関東甲信地方は、高気圧に緩やかに覆われていますが、上空の寒気や湿った空気の影響を受けている所があります。\n\n　東京地方は、晴れや曇りとなっています。")
    private static let dayDescription: DaysDetail = DaysDetail.init(weather: "晴れ　夜のはじめ頃　くもり　多摩西部　では　夜のはじめ頃　まで　雨　で　雷を伴い　激しく　降る", wind: "南の風　２３区西部　では　南の風　やや強く", wave: "１メートル" )
    private static let temperatureDetail: TemperatureDetail = TemperatureDetail.init(celsius: nil, fahrenheit: nil)
    private static let temperature: DaysTemperature = DaysTemperature.init(min: temperatureDetail, max: temperatureDetail)
    private static let chanceOfRain: DaysChanceOfRain = DaysChanceOfRain.init(tZeroToSix: "--%", tSixToTwelve: "--%", tTwelveToEighteen: "--%", tEighteenToTwentyFour: "20%")
    private static let image: DaysImage = DaysImage.init(title: "晴時々曇", url: "https://www.jma.go.jp/bosai/forecast/img/101.svg", width: 80, height: 60)
    private static let weatherDay: WeatherDay = WeatherDay.init(date: "2023-08-04", dateLabel: "今日", telop: "晴時々曇", detail: dayDescription, temperature: temperature, chanceOfRain: chanceOfRain, image: image)
    private static let location: WeatherLocation = WeatherLocation.init(area: "関東", prefecture: "東京都", district: "東京地方", city: "東京")
    private static let copyrightImage: CopyrightImage = CopyrightImage.init(title: "天気予報 API（livedoor 天気互換）", link: "https://weather.tsukumijima.net/", url: "https://weather.tsukumijima.net/logo.png", width: 120, height: 120)
    private static let copyrightProvider: CopyrightProvider = CopyrightProvider.init(link: "https://www.jma.go.jp/jma/", name: "気象庁 Japan Meteorological Agency", note: "気象庁 HP にて配信されている天気予報を JSON データへ編集しています。")
    private static let copyright: WeatherCopyright = WeatherCopyright.init(title: "(C) 天気予報 API（livedoor 天気互換）", link: "https://weather.tsukumijima.net/", image: copyrightImage, provider: [copyrightProvider])
    static let mock: Weather = Weather.init(publicTime: "2023-08-04T17:00:00+09:00", publicTimeFormatted: "2023/08/04 17:00:00", publishingOffice: "気象庁", title: "東京都 東京 の天気", link: "https://www.google.com", description: mockDescription, forecasts: [weatherDay, weatherDay, weatherDay], location: location, copyright: copyright)
}
