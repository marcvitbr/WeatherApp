//
//  DefaultForecastFetcher.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

final class DefaultForecastFetcher: ForecastFetcher {

    private let httpClient: HTTPClient
    private let forecastConverter: ForecastConverter

    init(httpClient: HTTPClient, forecastConverter: ForecastConverter) {

        self.httpClient = httpClient
        self.forecastConverter = forecastConverter
    }

    func fetchForecast(for city: City, receiver: @escaping (ForecastFetcherResult) -> Void) {

        self.httpClient.get(.forecast(for: city)) { [weak self] (result: Result<ForecastJSON, Error>) in

            guard let self = self else {

                receiver(.failure(ForecastFetcherError.couldNotFetchForecast))
                return
            }

            switch result {

            case .success(let forecastJSON):

                let forecast = self.forecastConverter.fromForecastJSON(forecastJSON)
                receiver(.success(forecast))
            case .failure(let error):

                print(error.localizedDescription)
                receiver(.failure(ForecastFetcherError.couldNotFetchForecast))
            }
        }
    }
}
