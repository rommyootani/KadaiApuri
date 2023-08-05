//
//  HTTPMethodTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
@testable import KadaiApuri

final class HTTPMethodTest: XCTestCase {

    func httpMethodTest_WhenHTTPMethodGetInstanced_ShouldHaveValidName() throws {
        let method = KadaiApuri.HTTPMethod.get
        let name = method.name
        XCTAssertEqual(name, "GET")
    }
    
    func httpMethodTest_WhenHTTPMethodDeleteInstanced_ShouldHaveValidName() throws {
        let method = KadaiApuri.HTTPMethod.delete
        let name = method.name
        XCTAssertEqual(name, "DELETE")
    }
    
    func httpMethodTest_WhenHTTPMethodPostInstanced_ShouldHaveValidName() throws {
        let method = KadaiApuri.HTTPMethod.post
        let name = method.name
        XCTAssertEqual(name, "POST")
    }
    
    func httpMethodTest_WhenHTTPMethodPutInstanced_ShouldHaveValidName() throws {
        let method = KadaiApuri.HTTPMethod.put
        let name = method.name
        XCTAssertEqual(name, "PUT")
    }
    
}
