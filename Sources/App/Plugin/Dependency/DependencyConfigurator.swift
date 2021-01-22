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

        dependencies.register(ForecastConverter.self) { () -> ForecastConverter in

            DefaultForecastConverter()
        }

        dependencies.register(ForecastFetcher.self) { () -> ForecastFetcher in

            DefaultForecastFetcher(httpClient: dependencies.instance(),
                                   forecastConverter: dependencies.instance())
        }

        dependencies.register(RequestForecast.self) { () -> RequestForecast in

            RequestForecastExecutor(fetcher: dependencies.instance())
        }
    }
}
