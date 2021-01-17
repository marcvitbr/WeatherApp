//
//  WeatherJSON.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

struct WeatherJSON: Codable {

    let title: String
    let description: String
    let iconName: String

    enum CodingKeys: String, CodingKey {
        case title = "main"
        case description = "description"
        case iconName = "icon"
    }
}
