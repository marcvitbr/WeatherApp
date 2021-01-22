//
//  RequestForecastSpy.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

@testable import WeatherApp

final class RequestForecastSpy: RequestForecast {

    var executeCount = 0

    var executeReturn: RequestForecastResult = .failure(RequestForecastError.couldNotObtainForecast)

    func execute(with input: City, receiver: @escaping (RequestForecastResult) -> ()) {

        self.executeCount += 1
        receiver(self.executeReturn)
    }
}
