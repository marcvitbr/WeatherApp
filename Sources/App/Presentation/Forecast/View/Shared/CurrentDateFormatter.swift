//
//  CurrentDateFormatter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import Foundation

final class CurrentDateFormatter {

    private lazy var dateFormatter: DateFormatter = {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM h:mm a"
        return dateFormatter
    }()

    func string(from currentDate: Date, timezone: TimeZone) -> String {

        self.dateFormatter.timeZone = timezone

        return self.dateFormatter.string(from: currentDate)
    }
}
