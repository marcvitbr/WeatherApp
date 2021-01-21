//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 20/01/2021.
//

import UIKit
import Foundation

class ForecastViewController: UIViewController {

    @IBOutlet weak var currentDayView: CurrentDayView!
    @IBOutlet weak var day1View: DayView!
    @IBOutlet weak var day2View: DayView!
    @IBOutlet weak var day3View: DayView!
    @IBOutlet weak var day4View: DayView!

    private lazy var requestForecast: some RequestForecast = {

        RequestForecastExecutor(fetcher: DefaultForecastFetcher(httpClient: DefaultHTTPClient(),
                                                                forecastConverter: DefaultForecastConverter()))
    }()

    private lazy var dateFormatter: DateFormatter = {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter
    }()

    private lazy var dayFormatter: DateFormatter = {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter
    }()

    private lazy var numberFormatter: NumberFormatter = {

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        return numberFormatter
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        let porto = City(latitude: 41.1552, longitude: -8.6326)

        self.requestForecast.execute(with: porto) { [weak self] result in

            switch result {

            case .success(let forecast):

                DispatchQueue.main.async { self?.presentForecast(forecast) }
            case .failure(let error):

                print(error.localizedDescription)
            }
        }
    }

    private func presentForecast(_ forecast: Forecast) {

        self.currentDayView.cityNameLabel.text = "Porto"
        self.currentDayView.dateLabel.text = self.dateFormatter.string(from: forecast.current.date)
        self.currentDayView.temperatureLabel.text = (self.numberFormatter.string(from: NSNumber(value: forecast.current.temperatureValue)) ?? "") + "º"
        self.currentDayView.weatherLabel.text = forecast.current.weather?.title ?? "--"

        let daysViews = [self.day1View, self.day2View, self.day3View, self.day4View]

        for i in 0..<daysViews.count {

            let day = forecast.days[i]

            guard let dayView = daysViews[i] else { continue }

            dayView.weekDayLabel.text = self.dayFormatter.string(from: day.date).uppercased()
            dayView.minTemperatureLabel.text = (self.numberFormatter.string(from: NSNumber(value: day.temperature.min)) ?? "") + "º"
            dayView.maxTemperatureLabel.text = (self.numberFormatter.string(from: NSNumber(value: day.temperature.max)) ?? "") + "º"
        }
    }
}
