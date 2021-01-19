//
//  DefaultForecastConverter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

import Foundation

final class DefaultForecastConverter: ForecastConverter {

    func fromForecastJSON(_ forecastJSON: ForecastJSON) -> Forecast {

        let city = City(latitude: forecastJSON.latitude,
                        longitude: forecastJSON.longitude)

        let currentDay = self.currentDayFromCurrentDayJSON(forecastJSON.currentDay)

        let days = self.daysFromDaysJSON(forecastJSON.days)

        return Forecast(city: city,
                        current: currentDay,
                        days: days)
    }

    private func currentDayFromCurrentDayJSON(_ currentDayJSON: CurrentDayJSON) -> CurrentDay {

        let weather = self.weatherFromWeathersJSON(currentDayJSON.weathers)

        return CurrentDay(date: Date(timeIntervalSince1970: currentDayJSON.date),
                          temperatureValue: currentDayJSON.temperatureValue,
                          weather: weather)
    }

    private func weatherFromWeathersJSON(_ weathersJSON: [WeatherJSON]) -> Weather? {

        guard let firstWeatherJSON = weathersJSON.first else { return nil }

        return Weather(title: firstWeatherJSON.title,
                       description: firstWeatherJSON.description,
                       iconName: firstWeatherJSON.iconName)
    }

    private func daysFromDaysJSON(_ daysJSON: [DayJSON]) -> [Day] {

        return daysJSON[1...].map {

            Day(date: Date(timeIntervalSince1970: $0.date),
                temperature: Temperature(actual: $0.temperature.day,
                                         min: $0.temperature.min,
                                         max: $0.temperature.max),
                weather: self.weatherFromWeathersJSON($0.weathers))
        }
    }
}
