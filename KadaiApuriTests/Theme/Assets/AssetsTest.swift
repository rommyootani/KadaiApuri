//
//  AssetsTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class AssetsTest: XCTestCase {

    func testAssetsTest_WhenImageInstanced_ShouldReturnNotNil() throws {
        let name = Assets.splash
        let image = UIImage(named: name)
        XCTAssertNotNil(image)
    }

}
