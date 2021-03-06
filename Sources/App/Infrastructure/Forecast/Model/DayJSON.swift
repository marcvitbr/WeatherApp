//
//  DayJSON.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

struct DayJSON: Codable {

    let date: Double
    let temperature: TemperatureJSON
    let weathers: [WeatherJSON]

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case weathers = "weather"
    }
}
