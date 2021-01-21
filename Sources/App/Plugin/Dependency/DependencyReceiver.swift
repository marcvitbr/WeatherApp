//
//  DependencyReceiver.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

protocol DependencyReceiver {}

extension DependencyReceiver {

    func instance<T>(of type: T.Type) -> T? {
        
        return DependencyProvider.shared.instance(of: T.self)
    }
}
