//
//  ForecastViewController+Refresh.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 24/01/2021.
//

import UIKit

extension ForecastViewController {

    func configureRefreshButton() {

        self.refreshImageButton.isUserInteractionEnabled = true
        self.refreshImageButton.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                            action: #selector(self.refresh)))
    }

    @objc
    private func refresh() {

        UIView.animate(withDuration: 0.5, animations: { [weak self] in

            guard let self = self else { return }
            self.refreshImageButton.transform = self.refreshImageButton.transform.rotated(by: .pi)
            self.refreshImageButton.transform = self.refreshImageButton.transform.rotated(by: .pi)
        })

        self.presenter.fetchForecast(inputCity: self.city)
    }
}
