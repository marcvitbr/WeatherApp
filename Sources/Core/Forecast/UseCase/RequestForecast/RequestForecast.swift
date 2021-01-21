//
//  RequestForecast.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

protocol RequestForecast {

    func execute(with input: City, receiver: @escaping (RequestForecastResult) -> ())
}
