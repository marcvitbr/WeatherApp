//
//  WeekdayFormatter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import Foundation

final class WeekdayFormatter {

    private lazy var dayFormatter: DateFormatter = {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter
    }()

    func string(from date: Date) -> String {

        self.dayFormatter.string(from: date)
    }
}
