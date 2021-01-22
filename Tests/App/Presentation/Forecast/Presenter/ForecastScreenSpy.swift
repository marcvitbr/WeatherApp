//
//  ForecastScreenSpy.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

@testable import WeatherApp

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
