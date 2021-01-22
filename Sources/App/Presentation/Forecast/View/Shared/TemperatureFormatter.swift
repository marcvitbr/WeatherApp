//
//  TemperatureFormatter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import Foundation

final class TemperatureFormatter {

    private lazy var numberFormatter: NumberFormatter = {

        let numberFormatter = NumberFormatter()
        numberFormatter.negativeFormat = "-##º"
        numberFormatter.positiveFormat = "##º"
        return numberFormatter
    }()

    func string(from temperature: Double) -> String {

        var temperature = temperature

        if temperature < 1 && temperature > 0 {

            temperature = abs(temperature)
        }

        return self.numberFormatter.string(from: NSNumber(value: temperature)) ?? "-"
    }
}
