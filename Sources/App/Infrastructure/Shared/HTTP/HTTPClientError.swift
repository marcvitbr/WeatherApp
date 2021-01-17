//
//  HTTPClientError.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

enum HTTPClientError: Error {

    case couldNotRetrieveDataFromServer
    case couldNotParseResponseJSON
}
