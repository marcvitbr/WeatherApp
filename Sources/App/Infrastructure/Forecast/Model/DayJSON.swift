//
//  DayJSON.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

struct DayJSON: Codable {

    let temperature: TemperatureJSON
    let weathers: [WeatherJSON]

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case weathers = "weather"
    }
}
