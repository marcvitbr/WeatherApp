//
//  CurrentDayViewUpdate.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

extension CurrentDayView {

    func update(cityName: String, currentDay: CurrentDay) {

        self.cityNameLabel.text = cityName

        self.dateLabel.text = self.currentDateFormatter.string(from: currentDay.date)

        self.temperatureLabel.text = self.temperatureFormatter.string(from: currentDay.temperatureValue)

        self.weatherLabel.text = currentDay.weather?.title
    }
}
