//
//  ForecastFetcher.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

typealias ForecastFetcherResult = Result<Forecast, ForecastFetcherError>

enum ForecastFetcherError: Error {

    case couldNotFetchForecast
}

protocol ForecastFetcher {

    func fetchForecast(for city: City,
                       receiver: @escaping (ForecastFetcherResult) -> ())
}
