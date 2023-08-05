//
//  MainViewModelTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 5/08/23.
//

import XCTest
import Combine
@testable import KadaiApuri

final class MainViewModelTest: XCTestCase {

    private var viewModelToTest: MainViewModel!
    private var marketPrice: WeatherRemoteMock!
    private var subscriber : Set<AnyCancellable> = []
    
    private var input: KadaiApuri.MainViewModel.InputType!
    
    override func setUp()  {
        viewModelToTest = KadaiApuri.MainViewModel()
        marketPrice = WeatherRemoteMock()
        input = KadaiApuri.MainViewModel.InputType.onAppear
    }
    
    override func tearDown() {
        subscriber.forEach { $0.cancel() }
        subscriber.removeAll()
        viewModelToTest = nil
        marketPrice = nil
        input = nil
        super.tearDown()
    }
    
    func testMainViewModel_WhenMarketServiceCalled_ShouldReturnResponse() {
        //Arrange
        let data = KadaiApuri.Weather.mock

        let expectation = XCTestExpectation(description: "State")
        // Act
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &subscriber)
        // Assert
        marketPrice.fetchedResult = Result.success(data).publisher.eraseToAnyPublisher()
        viewModelToTest.getTokyoData()

        wait(for: [expectation], timeout: 1)
    }
    
    func testMainViewModel_WhenMarketServiceCalled_ShouldReturnNil() {
        //Arrange
        let data = KadaiApuri.Weather()

        let expectation = XCTestExpectation(description: "State")
        // Act
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
              expectation.fulfill()
        }.store(in: &subscriber)
        // Assert
        marketPrice.fetchedResult = Result.success(data).publisher.eraseToAnyPublisher()
        viewModelToTest.getChibaData()

        wait(for: [expectation], timeout: 1)
    }

}
