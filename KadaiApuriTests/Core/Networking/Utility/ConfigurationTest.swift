//
//  ConfigurationTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class ConfigurationTest: XCTestCase {

    func testConfigurationTest_WhenBaseURLTypeInstancedBaseApi_ShouldReturnNotNil() throws {
        let base = BaseURLType.baseApi
        XCTAssertNotNil(base)
    }
    
}
