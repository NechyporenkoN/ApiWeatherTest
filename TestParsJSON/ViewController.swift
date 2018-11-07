//
//  ViewController.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 06.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let apiUrlForecast = "http://api.openweathermap.org/data/2.5/forecast?q="
    var city = "Kiev"
    var forecastOnFiveDays = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestForecast(apiUrl: apiUrlForecast, city: city)
    }
    
    func requestForecast(apiUrl: String, city: String) {
        let apiString = createUrlString(api: apiUrl, city: city)
        let urlString = apiString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                print(weatherData)
                let cityName = weatherData.city!.name!
                var index = -1
                for _ in 0..<5 {
                    index += 8
                    let list = weatherData.list![index]
                    print("index = \(index)")
                    let main = list.main
                    let temp = Int(main!.temp!)
                    print("TEMP = \(temp)")
                    let tempMin = main!.temp_min!
                    print("TEMPmin = \(tempMin)")
                    let tempMax = main!.temp_max!
                    print("TEMPmax = \(tempMax)")
                    let humidity = Int(main!.humidity!)
                    print("HUMIDITY = \(humidity)")
                    let weather = list.weather!.first!
                    let descriptionMain = weather.main!
                    print("DESCRIPT = \(descriptionMain)")
                    let icon = weather.icon!
                    print("ICON = \(icon)")
                    let windSpeed = list.wind!.speed!
                    print("SPEED = \(windSpeed)")
                    let dateStr = list.dt_txt!
                    let forecastOneDay = Forecast.init(name: cityName, temp: temp, tempMin: tempMin, tempMax: tempMax, humidity: humidity, icon: icon, windSpeed: windSpeed, date: dateStr, description: descriptionMain)
                    print("ONE DAY = \(forecastOneDay.date)")
                    self.forecastOnFiveDays.append(forecastOneDay)
                    print("DATE = \(dateStr)")
                    
                }
                print("ARREY = \(self.forecastOnFiveDays[0].date!)")
                
            } catch let error {
                print(error)
            }
            
            }.resume()
    }
    
    func getgAndAssignData() {
        
    }
    
    func createUrlString(api: String, city: String) -> String {
        let apiKey = "&APPID=7447a676e83a937bb338f7b427032adc&units=metric"
        let urlStr = api + city + apiKey
        return urlStr
    }
    
}
