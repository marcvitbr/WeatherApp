//
//  HTTPClient.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation

protocol HTTPClient {

    func get<T>(_ endpoint: Endpoint,
                resultHandler: @escaping (Result<T, Error>) -> ()) where T: Decodable
}
