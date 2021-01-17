//
//  HTTPClientError.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

enum HTTPClientError: Error {

    case couldNotFormRequestURL
    case couldNotRetrieveDataFromServer
    case couldNotParseResponseJSON
}
