//
//  ForecastFetcher.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

protocol ForecastFetcher {

    func fetchForecast(for city: City,
                       receiver: @escaping (ForecastFetcherResult) -> Void)
}
