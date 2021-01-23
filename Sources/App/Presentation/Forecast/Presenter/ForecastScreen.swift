//
//  ForecastScreen.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

import Foundation

protocol ForecastScreen: AnyObject {

    func showActivityIndicator()

    func hideActivityIndicator()

    func updateCityName(_ cityName: String)

    func updateCurrentDay(_ currentDay: CurrentDay)

    func updateDays(_ days: [Day], timezone: TimeZone)

    func showRequestErrorMessage()
}
