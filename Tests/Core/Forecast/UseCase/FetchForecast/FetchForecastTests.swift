//
//  FetchForecastTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import XCTest
@testable import WeatherApp

final class FetchForecastTests: XCTestCase {

    func test_fetchForecast_callsForecastFetcher() {

        let fetcherSpy = ForecastFetcherSpy()

        let fetchForecast = FetchForecast(fetcher: fetcherSpy)

        let exp = expectation(description: "Wait for FetchForecast execution")

        fetchForecast.execute(with: .anyCity) { result in

            exp.fulfill()
        }

        wait(for: [exp], timeout: 1)

        XCTAssertEqual(fetcherSpy.fetchForecastCount, 1)
    }
}
