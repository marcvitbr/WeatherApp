//
//  ViewController.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 16/01/2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var fetchForecast: FetchForecast = {

        FetchForecast(fetcher: DefaultForecastFetcher(httpClient: DefaultHTTPClient(),
                                                      forecastConverter: DefaultForecastConverter()))
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        let porto = City(latitude: 41.1552, longitude: -8.6326)

        self.fetchForecast.execute(with: porto) { result in

            switch result {

            case .success(let forecast):

                print(forecast)
                break
            case .failure(let error):

                print(error.localizedDescription)
                break
            }
        }
    }
}

