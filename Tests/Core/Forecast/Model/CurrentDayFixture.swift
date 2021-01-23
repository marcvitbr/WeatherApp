//
//  CurrentDayFixture.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 19/01/2021.
//

import Foundation
@testable import WeatherApp

extension CurrentDay {

    static let anyCurrentDay = CurrentDay(date: Date(),
                                          timezone: TimeZone.current,
                                          temperatureValue: 0,
                                          weather: nil)
}
