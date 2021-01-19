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

        XCTAssertNotNil(forecast.current)
        XCTAssertEqual(forecast.current?.temperature.min, forecastJSON.days.first?.temperature.min)
        XCTAssertEqual(forecast.current?.temperature.max, forecastJSON.days.first?.temperature.max)

        XCTAssertNotNil(forecast.current?.weather)
        XCTAssertEqual(forecast.current?.weather?.title, forecastJSON.days.first?.weathers.first?.title)
        XCTAssertEqual(forecast.current?.weather?.description, forecastJSON.days.first?.weathers.first?.description)
        XCTAssertEqual(forecast.current?.weather?.iconName, forecastJSON.days.first?.weathers.first?.iconName)

        XCTAssertEqual(forecast.days.count, forecastJSON.days.count - 1)
    }

    private func makeTestForecastJSON() -> ForecastJSON {

        ForecastJSON(latitude: 9,
                     longitude: 8,
                     days: [
                        DayJSON(temperature: TemperatureJSON(min: 1, max: 2),
                                weathers: [
                                    WeatherJSON(title: "weather1", description: "weather1", iconName: "weather1"),
                                    WeatherJSON(title: "weather2", description: "weather2", iconName: "weather2")
                                ]),
                        DayJSON(temperature: TemperatureJSON(min: 3, max: 4),
                                weathers: [
                                    WeatherJSON(title: "weather3", description: "weather3", iconName: "weather3"),
                                    WeatherJSON(title: "weather4", description: "weather4", iconName: "weather4")
                                ])
                     ])
    }
}
