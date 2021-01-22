//
//  DayViewUpdate.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

extension DayView {

    func update(_ day: Day) {

        self.weekDayLabel.text = self.weekdayFormatter.string(from: day.date)

        self.maxTemperatureLabel.text = self.temperatureFormatter.string(from: day.temperature.max)

        self.minTemperatureLabel.text = self.temperatureFormatter.string(from: day.temperature.min)
    }
}
