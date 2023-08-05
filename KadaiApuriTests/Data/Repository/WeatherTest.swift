//
//  WeatherRepositoryTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class WeatherRepositoryTest: XCTestCase {
    var sut: Weather!
    
    override func setUp() {
        // Arrange
        sut = Weather.mock
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testConformTo_Decodable() {
        XCTAssertTrue(sut as Any is Decodable)
    }
    
    func testConformTo_Equtable() {
        XCTAssertEqual(sut, sut)
    }
    
    func testWeather_ShouldReturnValidType() {
        XCTAssertTrue(sut.publicTime as Any is String)
        XCTAssertTrue(sut.publicTime == "2023-08-04T17:00:00+09:00")
        XCTAssertTrue(sut.publicTimeFormatted as Any is String)
        XCTAssertTrue(sut.publicTimeFormatted == "2023/08/04 17:00:00")
        XCTAssertTrue(sut.publishingOffice as Any is String)
        XCTAssertTrue(sut.publishingOffice == "気象庁")
        XCTAssertTrue(sut.title as Any is String)
        XCTAssertTrue(sut.title == "東京都 東京 の天気")
        XCTAssertTrue(sut.link as Any is String)
        XCTAssertTrue(sut.link == "https://www.google.com")
        XCTAssertTrue(sut.description as Any is WeatherDescription?)
        XCTAssertNotNil(sut.description)
        XCTAssertTrue(sut.forecasts as Any is [WeatherDay]?)
        XCTAssertNotNil(sut.forecasts)
        XCTAssertTrue(sut.location as Any is WeatherLocation?)
        XCTAssertNotNil(sut.location)
        XCTAssertTrue(sut.copyright as Any is WeatherCopyright?)
        XCTAssertNotNil(sut.copyright)
    }
}
