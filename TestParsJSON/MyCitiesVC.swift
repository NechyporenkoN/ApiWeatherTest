//
//  MyCityesVC.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 07.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class MyCitiesVC: UIViewController {
    
    @IBOutlet weak var iconFirstCity: UIImageView!
    
    @IBOutlet weak var nameFirstCityLabel: UILabel!
    @IBOutlet weak var tempFirstCityLabel: UILabel!
    
    var favoriteCitisArrey = ["Kiev", "Lviv"]
    var city = ""
    var temp = "10"
    var icon = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        requestWeather(apiUrl: "http://api.openweathermap.org/data/2.5/weather?q=", city: "Kiev")
        //        setupSkreen(city: city, temp: temp, icon: icon)
        ViewController().requestWeather(apiUrl: "http://api.openweathermap.org/data/2.5/weather?q=", city: "Kiev")
        
        ViewController().requestForecast(apiUrl: "http://api.openweathermap.org/data/2.5/forecast?q=", city: favoriteCitisArrey[1])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherSkreen" {
            let vc = segue.destination as? WeatherSkreenVC
            //                        vc?.cityName = city
            //                        vc?.iconWeather = icon
            //                        vc?.temperature = temp
        }
    }
    
    func requestWeather(apiUrl: String, city: String) {
        let apiString = ViewController().createUrlString(api: apiUrl, city: city)
        let urlString = apiString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let weatherDataToday = try JSONDecoder().decode(WeatherTodayData.self, from: data)
                let cityName = weatherDataToday.name!
                self.nameFirstCityLabel.text = cityName
                let temp = String(Int(weatherDataToday.main!.temp!))
                self.tempFirstCityLabel.text = temp
                let weather = weatherDataToday.weather.first!
                let icon = weather.icon!
                self.iconFirstCity.image = UIImage(named: icon)
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    func setupSkreen(city: String, temp: String, icon: String) {
        
        self.iconFirstCity.image = UIImage(named: icon)
        self.nameFirstCityLabel.text = city
        self.tempFirstCityLabel.text = temp + " \u{00B0}" + "C"
        
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        setupSkreen(city: forecastOnFiveDays[0].name!, temp: forecastOnFiveDays[0].temp!, icon: forecastOnFiveDays[0].icon!)
        print(" массив = \(forecastOnFiveDays[0].name)")
    }
    
}
