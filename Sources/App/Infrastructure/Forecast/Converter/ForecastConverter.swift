//
//  ForecastConverter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 18/01/2021.
//

protocol ForecastConverter {

    func fromForecastJSON(_ forecastJSON: ForecastJSON) -> Forecast
}
