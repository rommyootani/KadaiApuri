//
//  URLExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class URLExtensionTest: XCTestCase {
    
    func urlExtensionTest_WhenURLInitializeWithStringURL_ShouldReturnValidType() throws {
        let urlString = "https://www.google.com/"
        let url = URL(string: urlString)
        XCTAssertTrue(url as Any is URL)
    }
    
}
