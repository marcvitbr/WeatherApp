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
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter
    }()

    func string(from currentDate: Date) -> String {

        self.dateFormatter.string(from: currentDate)
    }
}
