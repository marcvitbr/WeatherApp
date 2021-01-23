//
//  DefaultForecastFetcherTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import XCTest
@testable import WeatherApp

final class DefaultForecastFetcherTests: XCTestCase {

    func test_fetchForecast_callsHttpClient() {

        let httpClientSpy = HTTPClientSpy()
        let forecastConverterSpy = ForecastConverterSpy()

        let fetcher = DefaultForecastFetcher(httpClient: httpClientSpy,
                                             forecastConverter: forecastConverterSpy)

        let exp = expectation(description: "Wait for DefaultForecastFetcher execution")

        fetcher.fetchForecast(for: .anyCity) { _ in

            exp.fulfill()
        }

        wait(for: [exp], timeout: 0.1)

        XCTAssertEqual(httpClientSpy.getCount, 1)
    }

    func test_fetchForecast_usesCorrectEndpoint() {

        let httpClientSpy = HTTPClientSpy()
        let forecastConverterSpy = ForecastConverterSpy()

        let fetcher = DefaultForecastFetcher(httpClient: httpClientSpy,
                                             forecastConverter: forecastConverterSpy)

        let expectedEndpoint: Endpoint = .forecast(for: .anyCity)

        let exp = expectation(description: "Wait for DefaultForecastFetcher execution")

        fetcher.fetchForecast(for: .anyCity) { _ in

            exp.fulfill()
        }

        wait(for: [exp], timeout: 0.1)

        guard let endpoint = httpClientSpy.getEndpoint else {

            XCTFail("HTTPClientSpy should have a Forecast endpoint stored")
            return
        }

        XCTAssertEqual(endpoint, expectedEndpoint)
    }
}
