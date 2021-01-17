//
//  ForecastFetcherSpy.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

@testable import WeatherApp

final class ForecastFetcherSpy: ForecastFetcher {

    var fetchForecastCount = 0

    var fetchForecastReturn: ForecastFetcherResult = .failure(ForecastFetcherError.couldNotFetchForecast)

    func fetchForecast(for city: City, receiver: (ForecastFetcherResult) -> ()) {

        self.fetchForecastCount += 1
        receiver(self.fetchForecastReturn)
    }
}
