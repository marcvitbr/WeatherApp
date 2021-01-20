//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Marcelo Vitoria on 20/01/2021.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var currentDayView: CurrentDayView!
    @IBOutlet weak var day1View: DayView!
    @IBOutlet weak var day2View: DayView!
    @IBOutlet weak var day3View: DayView!
    @IBOutlet weak var day4View: DayView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
