//
//  CurrentDayViewUpdate.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

extension CurrentDayView {

    func update(cityName: String) {

        self.cityNameLabel.text = cityName
    }

    func update(currentDay: CurrentDay) {

        self.dateLabel.setTextAnimated(self.currentDateFormatter.string(from: currentDay.date))

        self.temperatureLabel.setTextAnimated(self.temperatureFormatter.string(from: currentDay.temperatureValue))

        self.weatherLabel.setTextAnimated(currentDay.weather?.title)
    }
}
