//
//  UIImageView+AnimatedImage.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 22/01/2021.
//

import UIKit

extension UIImageView {

    func load(url: URL) {

        DispatchQueue.global().async { [weak self] in

            self?.downloadImage(url)
        }
    }

    private func downloadImage(_ url: URL) {

        guard let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else { return }

        DispatchQueue.main.async { [weak self] in

            self?.setImageAnimated(image)
        }
    }

    private func setImageAnimated(_ image: UIImage) {

        UIView.animate(withDuration: .imageAnimationDuration, animations: { [weak self] in

            self?.alpha = 0
        }, completion: { [weak self] _ in

            self?.image = image

            UIView.animate(withDuration: .imageAnimationDuration) {

                self?.alpha = 1
            }
        })
    }
}

private extension TimeInterval {

    static let imageAnimationDuration: TimeInterval = 0.3
}
