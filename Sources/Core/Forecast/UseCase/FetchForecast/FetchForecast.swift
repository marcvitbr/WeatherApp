//
//  FetchForecast.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

final class FetchForecast: ParameterizedUseCase {

    private let fetcher: ForecastFetcher

    init(fetcher: ForecastFetcher) {

        self.fetcher = fetcher
    }

    func execute(with input: City, receiver: (ForecastFetcherResult) -> ()) {

        self.fetcher.fetchForecast(for: input,
                                   receiver: receiver)
    }
}
