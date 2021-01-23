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
    let timezone: String
    let currentDay: CurrentDayJSON
    let days: [DayJSON]

    enum CodingKeys: String, CodingKey {
        case timezone = "timezone"
        case currentDay = "current"
        case latitude = "lat"
        case longitude = "lon"
        case days = "daily"
    }
}
