//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

import Foundation

struct Endpoint {

    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {

    var url: URL? {

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = self.path
        components.queryItems = self.queryItems

        return components.url
    }
}

extension Endpoint {

    static func forecast(for city: City) -> Endpoint {

        return Endpoint(path: "/data/2.5/onecall",
                        queryItems: [
                            URLQueryItem(name: "lat", value: String(city.latitude)),
                            URLQueryItem(name: "lon", value: String(city.longitude)),
                            URLQueryItem(name: "units", value: "metric"),
                            URLQueryItem(name: "exclude", value: "minutely,hourly,alerts"),
                            URLQueryItem(name: "appid", value: "d110d7cb1f8ae906157799167a3f3ae0")])
    }
}
