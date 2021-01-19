//
//  ForecastJSON.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation

struct ForecastJSON: Codable {

    let latitude: Double
    let longitude: Double
    let currentDay: CurrentDayJSON
    let days: [DayJSON]

    enum CodingKeys: String, CodingKey {
        case currentDay = "current"
        case latitude = "lat"
        case longitude = "lon"
        case days = "daily"
    }
}
