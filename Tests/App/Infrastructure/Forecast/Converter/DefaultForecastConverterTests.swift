//
//  DefaultForecastConverterTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

import XCTest
@testable import WeatherApp

final class DefaultForecastConverterTests: XCTestCase {

    func test_fromForecastJSON_convertsSuccessfully() {

        let converter = DefaultForecastConverter()

        let forecastJSON = self.makeTestForecastJSON()

        let forecast = converter.fromForecastJSON(forecastJSON)

        XCTAssertEqual(forecast.city.latitude, forecastJSON.latitude)
        XCTAssertEqual(forecast.city.longitude, forecastJSON.longitude)

        XCTAssertEqual(forecast.current.temperatureValue, forecastJSON.currentDay.temperatureValue)
        XCTAssertEqual(forecast.current.date, Date(timeIntervalSince1970: forecastJSON.currentDay.date))

        XCTAssertNotNil(forecast.current.weather)
        XCTAssertEqual(forecast.current.weather?.title, forecastJSON.currentDay.weathers.first?.title)
        XCTAssertEqual(forecast.current.weather?.description, forecastJSON.currentDay.weathers.first?.description)
        XCTAssertEqual(forecast.current.weather?.iconName, forecastJSON.currentDay.weathers.first?.iconName)

        XCTAssertEqual(forecast.days.count, forecastJSON.days.count - 1)
    }

    private func makeTestForecastJSON() -> ForecastJSON {

        ForecastJSON(latitude: 9,
                     longitude: 8,
                     currentDay: CurrentDayJSON(date: 1611086991,
                                                temperatureValue: 12,
                                                weathers: [
                                                    WeatherJSON(title: "weather0",
                                                                description: "weather0",
                                                                iconName: "weather0")
                                                ]),
                     days: [
                        DayJSON(date: 1611144000,
                                temperature: TemperatureJSON(day: 1, min: 0, max: 2),
                                weathers: [
                                    WeatherJSON(title: "weather1", description: "weather1", iconName: "weather1"),
                                    WeatherJSON(title: "weather2", description: "weather2", iconName: "weather2")
                                ]),
                        DayJSON(date: 1611230400,
                                temperature: TemperatureJSON(day: 3, min: 2, max: 4),
                                weathers: [
                                    WeatherJSON(title: "weather3", description: "weather3", iconName: "weather3"),
                                    WeatherJSON(title: "weather4", description: "weather4", iconName: "weather4")
                                ])
                     ])
    }
}
