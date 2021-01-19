//
//  DefaultForecastConverter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

final class DefaultForecastConverter: ForecastConverter {

    func fromForecastJSON(_ forecastJSON: ForecastJSON) -> Forecast {

        let city = City(latitude: forecastJSON.latitude,
                        longitude: forecastJSON.longitude)

        let currentDay = self.currentDayFromDaysJSON(forecastJSON.days)

        let days = self.daysFromDaysJSON(forecastJSON.days)

        return Forecast(city: city,
                        current: currentDay,
                        days: days)
    }

    private func currentDayFromDaysJSON(_ daysJSON: [DayJSON]) -> Day? {

        guard let currentDayJSON = daysJSON.first else { return nil }

        let weather = self.weatherFromWeathersJSON(currentDayJSON.weathers)

        return Day(temperature: Temperature(min: currentDayJSON.temperature.min,
                                            max: currentDayJSON.temperature.max),
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

            Day(temperature: Temperature(min: $0.temperature.min,
                                         max: $0.temperature.max),
                weather: self.weatherFromWeathersJSON($0.weathers))
        }
    }
}
