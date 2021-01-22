//
//  UILabel+AnimatedText.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import UIKit

extension UILabel {

    func setTextAnimated(_ text: String?) {

        UIView.animate(withDuration: .textAnimationDuration) {

            self.alpha = 0
        } completion: { _ in

            self.text = text

            UIView.animate(withDuration: .textAnimationDuration) {

                self.alpha = 1
            }
        }
    }
}

private extension TimeInterval {

    static let textAnimationDuration: TimeInterval = 0.3
}
