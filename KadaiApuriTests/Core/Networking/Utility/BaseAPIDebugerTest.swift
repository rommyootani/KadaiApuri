//
//  BaseAPIDebugerTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class BaseAPIDebugerTest: XCTestCase {

    func testBaseAPIDebugerTest_WhenURLRequestCalledLog_ShouldPrintValidData() throws {
        guard let url = URL(string: "https://www.google.com/") else {
            fatalError("error")
        }
        let request = URLRequest(url: url)
        let base: () = BaseAPIDebuger().log(request: request, error: nil)
        XCTAssertNotNil(base)
    }
    
    func testData_WhenPrintableJSONCalled_ShouldReturnNil() throws {
        let data = Data()
        let json = data.printableJSON
        XCTAssertEqual(json, nil)
    }

}
