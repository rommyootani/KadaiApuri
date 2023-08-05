//
//  DateFormatterTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 4/08/23.
//

import XCTest
@testable import KadaiApuri

final class DateFormatterTest: XCTestCase {

    func dateFormatterTest_WhenDateFormatterToJapaneseFormat_ShouldReturnValidString() throws {
        let datestring = "2023-11-09"
        guard let date = datestring.toDate() else {
            fatalError("Error")
        }
        let dateString = itemFormatter.string(from: date)
        XCTAssertEqual(dateString, "2023年11月9日")
    }
    
}
