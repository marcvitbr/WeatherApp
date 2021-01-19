//
//  ForecastConverterSpy.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

@testable import WeatherApp

final class ForecastConverterSpy: ForecastConverter {

    var fromForecastJSONCount = 0
    var fromForecastJSONReturn: Forecast = .anyForecast

    func fromForecastJSON(_ forecastJSON: ForecastJSON) -> Forecast {

        self.fromForecastJSONCount += 1
        return fromForecastJSONReturn
    }
}
