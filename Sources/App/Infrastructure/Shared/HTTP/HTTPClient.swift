//
//  HTTPClient.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation

protocol HTTPClient {

    func get<T: Decodable>(_ url: URL,
                           parameters: [String: Any],
                           resultHandler: @escaping (Result<T, Error>) -> ())
}
