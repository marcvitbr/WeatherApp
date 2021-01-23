//
//  RequestForecastExecutorTests.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import XCTest
@testable import WeatherApp

final class RequestForecastExecutorTests: XCTestCase {

    func test_requestForecast_callsForecastFetcher() {

        let fetcherSpy = ForecastFetcherSpy()

        let requestForecast = RequestForecastExecutor(fetcher: fetcherSpy)

        let exp = expectation(description: "Wait for FetchForecast execution")

        requestForecast.execute(with: .anyCity) { _ in

            exp.fulfill()
        }

        wait(for: [exp], timeout: 1)

        XCTAssertEqual(fetcherSpy.fetchForecastCount, 1)
    }
}
