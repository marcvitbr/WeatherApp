//
//  ParameterizedUseCase.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 17/01/2021.
//

protocol ParameterizedUseCase {

    associatedtype Input
    associatedtype Output

    func execute(with input: Input, receiver: (Output) -> ())
}
