//
//  DayView.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 20/01/2021.
//

import UIKit

class DayView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.initialize()
    }

    override init(frame: CGRect) {

        super.init(frame: frame)
        self.initialize()
    }

    private func initialize() {

        self.loadNib()

        //self.configureProfilePictureImageView()
    }

    private func loadNib() {

        let nib = UINib(nibName: "DayView", bundle: nil)

        nib.instantiate(withOwner: self, options: nil)

        self.contentView.frame = self.bounds

        self.addSubview(self.contentView)
    }
}
