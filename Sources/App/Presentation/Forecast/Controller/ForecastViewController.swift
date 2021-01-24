//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 20/01/2021.
//

import UIKit
import Foundation

class ForecastViewController: UIViewController, DependencyReceiver {

    @IBOutlet weak var currentDayView: CurrentDayView!
    @IBOutlet weak var day1View: DayView!
    @IBOutlet weak var day2View: DayView!
    @IBOutlet weak var day3View: DayView!
    @IBOutlet weak var day4View: DayView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var refreshImageButton: UIImageView!
    
    private(set) lazy var presenter: ForecastPresenter = {

        ForecastPresenter(requestForecast: self.instance(), screen: self)
    }()

    private(set) lazy var city: InputCity = {

        let porto = InputCity(name: "Porto", latitude: 41.1552, longitude: -8.6326)
        let tallinn = InputCity(name: "Tallinn", latitude: 59.437, longitude: 24.753)
        let copenhagen = InputCity(name: "Copenhagen", latitude: 55.6759, longitude: 12.5655)
        let moscow = InputCity(name: "Moscow", latitude: 55.7522, longitude: 37.6156)

        return porto
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        self.configureRefreshButton()
        
        self.presenter.fetchForecast(inputCity: self.city)
    }

}
