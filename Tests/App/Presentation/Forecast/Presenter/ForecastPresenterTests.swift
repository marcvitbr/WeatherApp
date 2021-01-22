//
//  ForecastPresenterTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

import XCTest
@testable import WeatherApp

final class ForecastPresenterTests: XCTestCase {

    func test_fetchForecast_successfullyFetchesAndDisplayForecast() {

        let screenSpy = ForecastScreenSpy()

        let requestForecastSpy = RequestForecastSpy()
        requestForecastSpy.executeReturn = .success(.anyForecast)

        let presenter = ForecastPresenter(requestForecast: requestForecastSpy, screen: screenSpy)

        presenter.fetchForecast(inputCity: .anyInputCity)

        XCTAssertEqual(screenSpy.showActivityIndicatorCount, 1)
        XCTAssertEqual(requestForecastSpy.executeCount, 1)
        XCTAssertEqual(screenSpy.updateCurrentDayCount, 1)
        XCTAssertEqual(screenSpy.updateDaysCount, 1)
        XCTAssertEqual(screenSpy.hideActivityIndicatorCount, 1)
    }
}
