//
//  RequestForecast.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

final class RequestForecast: ParameterizedUseCase {

    private let fetcher: ForecastFetcher

    init(fetcher: ForecastFetcher) {

        self.fetcher = fetcher
    }

    func execute(with input: City, receiver: @escaping (RequestForecastResult) -> ()) {

        self.fetcher.fetchForecast(for: input) { result in

            switch result {

            case .success(let forecast):

                receiver(.success(forecast))
                break
            case .failure(let error):

                print(error.localizedDescription)
                receiver(.failure(RequestForecastError.couldNotObtainForecast))
                break
            }
        }
    }
}
