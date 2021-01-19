//
//  HTTPClientSpy.swift
//  WeatherAppTests
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation
@testable import WeatherApp

final class HTTPClientSpy: HTTPClient {

    var getCount = 0
    var getReturn: Decodable?
    private(set) var getEndpoint: Endpoint?

    func get<T>(_ endpoint: Endpoint, resultHandler: @escaping (Result<T, Error>) -> ()) where T : Decodable {

        self.getCount += 1

        self.getEndpoint = endpoint

        guard let resultObject = self.getReturn as? T else {

            resultHandler(.failure(HTTPClientError.couldNotRetrieveDataFromServer))
            return
        }

        resultHandler(.success(resultObject))
    }
}
