//
//  ForecastViewController+ForecastScreen.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import UIKit

extension ForecastViewController: ForecastScreen {

    func showActivityIndicator() {

        DispatchQueue.main.async {

            self.activityIndicator.startAnimating()
            self.refreshImageButton.isUserInteractionEnabled = false
        }
    }

    func hideActivityIndicator() {

        DispatchQueue.main.async {
            
            self.activityIndicator.stopAnimating()
            self.refreshImageButton.isUserInteractionEnabled = true
        }
    }

    func updateCityName(_ cityName: String) {

        DispatchQueue.main.async { self.currentDayView.update(cityName: cityName) }
    }

    func updateCurrentDay(_ currentDay: CurrentDay) {

        DispatchQueue.main.async { self.currentDayView.update(currentDay: currentDay) }
    }

    func updateDays(_ days: [Day], timezone: TimeZone) {

        DispatchQueue.main.async {

            let daysViews = [self.day1View,
                             self.day2View,
                             self.day3View,
                             self.day4View]

            for i in 0..<daysViews.count {

                if i >= days.count { break }

                guard let dayView = daysViews[i] else { continue }

                dayView.update(days[i], timezone: timezone)
            }
        }
    }

    func showRequestErrorMessage() {

        DispatchQueue.main.async {

            let alert = UIAlertController(title: "Weather App",
                                      message: "Sorry, we could not obtain the forecast. Please try again later.",
                                      preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in

                alert.dismiss(animated: true, completion: nil)
            })

            alert.addAction(okAction)

            self.present(alert, animated: true, completion: nil)
        }
    }
}
