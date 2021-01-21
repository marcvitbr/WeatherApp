//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

final class ForecastPresenter {

    private let requestForecast: RequestForecast
    private weak var screen: ForecastScreen?

    init(requestForecast: RequestForecast, screen: ForecastScreen) {

        self.requestForecast = requestForecast
        self.screen = screen
    }

    func fetchForecast(inputCity: InputCity) {

        self.screen?.updateCityName(inputCity.name)

        self.screen?.showActivityIndicator()

        let city = City(latitude: inputCity.latitude, longitude: inputCity.longitude)

        self.requestForecast.execute(with: city) { [weak self] result in

            guard let self = self else { return }

            switch result {

            case .success(let forecast):

                self.screen?.updateCurrentDay(forecast.current)
                self.screen?.updateDays(forecast.days)
            case .failure(let error):

                print(error.localizedDescription)
                self.screen?.showRequestErrorMessage()
            }

            self.screen?.hideActivityIndicator()
        }
    }
}
