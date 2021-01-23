//
//  RequestForecastExecutor.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

final class RequestForecastExecutor: RequestForecast {

    private let fetcher: ForecastFetcher

    init(fetcher: ForecastFetcher) {

        self.fetcher = fetcher
    }

    func execute(with input: City, receiver: @escaping (RequestForecastResult) -> Void) {

        self.fetcher.fetchForecast(for: input) { result in

            switch result {

            case .success(let forecast):

                receiver(.success(forecast))
            case .failure(let error):

                print(error.localizedDescription)
                receiver(.failure(RequestForecastError.couldNotObtainForecast))
            }
        }
    }
}
