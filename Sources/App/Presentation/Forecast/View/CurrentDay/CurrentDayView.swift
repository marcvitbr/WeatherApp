//
//  CurrentDayView.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 20/01/2021.
//

import UIKit

class CurrentDayView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!

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

        let nib = UINib(nibName: "CurrentDayView", bundle: nil)

        nib.instantiate(withOwner: self, options: nil)

        self.contentView.frame = self.bounds

        self.addSubview(self.contentView)
    }
}
