//
//  CancelableTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class CancelableTest: XCTestCase {

    func testCancelableTest_WhenCancelableCallCancel_ShouldReturnZero() throws {
        let subscriber = Cancelable()
        subscriber.cancel()
        XCTAssertEqual(subscriber.subscriptions.count, 0)
    }
    
}
