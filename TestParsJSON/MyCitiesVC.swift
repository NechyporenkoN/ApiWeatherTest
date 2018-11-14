//
//  MyCityesVC.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 07.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class MyCityesVC: UIViewController {

    @IBOutlet weak var iconFirstCity: UIImageView!
    
    @IBOutlet weak var nameFirstCityLabel: UILabel!
    @IBOutlet weak var tempFirstCityLabel: UILabel!
    
    var city = "Kiev"
    var temp = "10" + " \u{00B0}" + "C"
    var icon = "02d"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupSkreen(city: city, temp: temp, icon: icon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherSkreen" {
            let vc = segue.destination as? WeatherSkreenVC
            vc?.cityName = city
            vc?.iconWeather = icon
            vc?.temperature = temp
        }
    }
    
    func setupSkreen(city: String, temp: String, icon: String) {
        self.iconFirstCity.image = UIImage(named: icon)
        self.nameFirstCityLabel.text = city
        self.tempFirstCityLabel.text = temp
    }
}
