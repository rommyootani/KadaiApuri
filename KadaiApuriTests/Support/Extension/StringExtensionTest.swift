//
//  StringExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class StringExtensionTest: XCTestCase {

    func stringExtensionTest_WhenStringConvertedToDate_ShouldReturnValidType() throws {
        let datestring = "2023-11-09"
        let date = datestring.toDate()
        XCTAssertTrue(date as Any is Date)
    }
    
    func stringExtensionTest_WhenStringConvertedToDate_ShouldReturnInvalidType() throws {
        let datestring = "2023-11-09xx"
        let date = datestring.toDate()
        XCTAssertNil(date)
    }
    
    func stringExtensionTest_WhenStringTrimmedLeadingSpaces_ShouldReturnValidString() throws {
        var datestring = " Example"
        datestring = datestring.trimingLeadingSpaces()
        XCTAssertEqual(datestring, "Example")
    }

    func stringExtensionTest_WhenStringTrimAndFixingSpaces_ShouldReturnValidString() throws {
        var datestring = " Example\n\n　Example"
        datestring = datestring.trimingAndFixingSpaces()
        XCTAssertEqual(datestring, "Example\n\nExample")
    }

}
