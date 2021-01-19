//
//  ForecastFixture.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

@testable import WeatherApp

extension Forecast {

    static let anyForecast = Forecast(city: .anyCity,
                                      current: .anyCurrentDay,
                                      days: [])
}
