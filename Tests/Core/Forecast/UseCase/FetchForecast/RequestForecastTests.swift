//
//  FetchForecastTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import XCTest
@testable import WeatherApp

final class RequestForecastTests: XCTestCase {

    func test_requestForecast_callsForecastFetcher() {

        let fetcherSpy = ForecastFetcherSpy()

        let requestForecast = RequestForecast(fetcher: fetcherSpy)

        let exp = expectation(description: "Wait for FetchForecast execution")

        requestForecast.execute(with: .anyCity) { result in

            exp.fulfill()
        }

        wait(for: [exp], timeout: 1)

        XCTAssertEqual(fetcherSpy.fetchForecastCount, 1)
    }
}
