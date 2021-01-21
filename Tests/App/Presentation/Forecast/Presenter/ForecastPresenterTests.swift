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

final class RequestForecastSpy: RequestForecast {

    var executeCount = 0

    var executeReturn: RequestForecastResult = .failure(RequestForecastError.couldNotObtainForecast)

    func execute(with input: City, receiver: @escaping (RequestForecastResult) -> ()) {

        self.executeCount += 1
        receiver(self.executeReturn)
    }
}

final class ForecastScreenSpy: ForecastScreen {

    var showActivityIndicatorCount = 0

    var hideActivityIndicatorCount = 0

    var updateCityNameCount = 0

    var updateCurrentDayCount = 0

    var updateDaysCount = 0

    var showRequestErrorMessageCount = 0

    func showActivityIndicator() {

        self.showActivityIndicatorCount += 1
    }

    func hideActivityIndicator() {

        self.hideActivityIndicatorCount += 1
    }

    func updateCurrentDay(_ currentDay: CurrentDay) {

        self.updateCurrentDayCount += 1
    }

    func updateCityName(_ cityName: String) {

        self.updateCityNameCount += 1
    }

    func updateDays(_ days: [Day]) {

        self.updateDaysCount += 1
    }

    func showRequestErrorMessage() {

        self.showRequestErrorMessageCount += 1
    }
}
