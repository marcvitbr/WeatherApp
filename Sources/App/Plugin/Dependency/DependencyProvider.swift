//
//  DependencyProvider.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 21/01/2021.
//

final class DependencyProvider {

    static let shared = DependencyProvider()

    private var instances = [String: Any]()

    func register<T>(_ type: T.Type, instance: T) {

        let typeDescription = String(describing: T.self)

        self.instances[typeDescription] = instance
    }

    func register<T>(_ type: T.Type, creator: @escaping () -> T) {

        let typeDescription = String(describing: T.self)

        self.instances[typeDescription] = creator
    }

    func instance<T>(of type: T.Type) -> T? {

        let typeDescription = String(describing: T.self)

        if let creator = self.instances[typeDescription] as? (() -> T) {
            return creator()
        }

        return self.instances[typeDescription] as? T
    }
}
