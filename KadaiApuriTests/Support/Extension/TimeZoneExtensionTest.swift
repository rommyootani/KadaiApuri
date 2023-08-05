//
//  TimeZoneExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class TimeZoneExtensionTest: XCTestCase {

    func timeZoneTest_WhenTimeZoneJapanInstanced_ShouldHaveValidIdentifier() throws {
        let timezone = TimeZone.japan
        let text = timezone.identifier
        XCTAssertEqual(text, "Asia/Tokyo")
    }

}
