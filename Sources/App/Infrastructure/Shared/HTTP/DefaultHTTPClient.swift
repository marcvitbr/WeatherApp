//
//  DefaultHTTPClient.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation

final class DefaultHTTPClient: HTTPClient {

    private lazy var jsonDecoder = JSONDecoder()

    func get<T: Decodable>(_ url: URL,
                           parameters: [String: Any],
                           resultHandler: @escaping (Result<T, Error>) -> ()) {

        let session = URLSession.shared

        session.dataTask(with: url) { [weak self] data, response, error in

            guard let data = data else {

                resultHandler(.failure(HTTPClientError.couldNotRetrieveDataFromServer))
                return
            }

            guard let resultObject = try? self?.jsonDecoder.decode(T.self, from: data) else {

                resultHandler(.failure(HTTPClientError.couldNotParseResponseJSON))
                return
            }

            resultHandler(.success(resultObject))
        }
        .resume()
    }
}
