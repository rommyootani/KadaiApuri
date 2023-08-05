//
//  LocaleExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class LocaleExtensionTest: XCTestCase {

    func localeExtensionTest_WhenLocaleJapanInstanced_ShouldHaveValidIdentifier() throws {
        let locale = Locale.japan
        let text = locale.identifier
        XCTAssertEqual(text, "ja_JP")
    }

}
