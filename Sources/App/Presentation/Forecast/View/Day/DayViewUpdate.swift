//
//  DayViewUpdate.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import Foundation

extension DayView {

    func update(_ day: Day, timezone: TimeZone) {

        self.weekDayLabel.setTextAnimated(self.weekdayFormatter.string(from: day.date,
                                                                       timezone: timezone))

        self.maxTemperatureLabel.setTextAnimated(self.temperatureFormatter.string(from: day.temperature.max))

        self.minTemperatureLabel.setTextAnimated(self.temperatureFormatter.string(from: day.temperature.min))

        self.updateIconIfNeeded(day)
    }

    private func updateIconIfNeeded(_ day: Day) {

        guard let iconName = day.weather?.iconName else { return }

        let endpoint: Endpoint = .weatherIcon(iconName: iconName)

        guard let url = endpoint.url else { return }

        self.weatherIconImageView.load(url: url)
    }
}
