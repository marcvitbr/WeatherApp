//
//  CurrentDayJSON.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

struct CurrentDayJSON: Codable {

    let date: Double
    let temperatureValue: Double
    let weathers: [WeatherJSON]

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperatureValue = "temp"
        case weathers = "weather"
    }
}
