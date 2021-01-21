//
//  DependencyConfigurator.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

final class DependencyConfigurator {

    func configureDependencies() {

        let dependencies = DependencyProvider.shared

        let defaultHttpClient = DefaultHTTPClient()
        dependencies.register(HTTPClient.self, instance: defaultHttpClient)
    }
}
