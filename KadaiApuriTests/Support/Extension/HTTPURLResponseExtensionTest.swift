//
//  HTTPURLResponseExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class HTTPURLResponseExtensionTest: XCTestCase {

    func httpURLResponseExtensionTest_WhenIsResponseOKCalledFromHTTPResponse_ShouldReturnValidType() throws {
        let response = HTTPURLResponse()
        let isOk = response.isResponseOK
        XCTAssertEqual(isOk, true)
    }

}
