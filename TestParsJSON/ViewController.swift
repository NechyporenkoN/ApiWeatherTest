//
//  ViewController.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 06.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit

var forecastOnFiveDays = [Forecast]()
var weatherToday = [Forecast]()

class ViewController: UIViewController {
    
    let apiUrlForecast = "http://api.openweathermap.org/data/2.5/forecast?q="
    var city = "Kiev"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        requestForecast(apiUrl: apiUrlForecast, city: city)
    }
    
    func requestForecast(apiUrl: String, city: String) {
        
        let apiString = self.createUrlString(api: apiUrl, city: city)
        let urlString = apiString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                let cityName = weatherData.city!.name!
                var index = -1
                for _ in 0..<5 {
                    index += 8
                    let list = weatherData.list![index]
                    let main = list.main
                    let temp = String(Int(main!.temp!))
                    let tempMin = main!.temp_min!
                    let tempMax = main!.temp_max!
                    let humidity = String(Int(main!.humidity!))
                    let weather = list.weather!.first!
                    let descriptionMain = weather.main!
                    let icon = weather.icon!
                    let windSpeed = list.wind!.speed!
                    let dateStr = list.dt_txt!
                    let forecastOneDay = Forecast.init(name: cityName, temp: temp, tempMin: tempMin, tempMax: tempMax, humidity: humidity, icon: icon, windSpeed: windSpeed, date: dateStr, description: descriptionMain)
                    forecastOnFiveDays.append(forecastOneDay)
                }
            } catch let error {
                print(error)
            }
            
            }.resume()
    }
    
    func requestWeather(apiUrl: String, city: String) {
        let apiString = self.createUrlString(api: apiUrl, city: city)
        let urlString = apiString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let weatherDataToday = try JSONDecoder().decode(WeatherTodayData.self, from: data)
                let cityName = weatherDataToday.name!
                let temp = String(Int(weatherDataToday.main!.temp!))
                let tempMin = weatherDataToday.main!.temp_min!
                let tempMax = weatherDataToday.main!.temp_max!
                let humidity = String(Int(weatherDataToday.main!.humidity!))
                let weather = weatherDataToday.weather.first!
                let descriptionMain = weather.main!
                let icon = weather.icon!
                let windSpeed = weatherDataToday.wind!.speed!
                let weatherNow = Forecast.init(name: cityName, temp: temp, tempMin: tempMin, tempMax: tempMax, humidity: humidity, icon: icon, windSpeed: windSpeed, date: cityName, description: descriptionMain)
                weatherToday.append(weatherNow)
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
    func createUrlString(api: String, city: String) -> String {
        let apiKey = "&APPID=7447a676e83a937bb338f7b427032adc&units=metric"
        let urlStr = api + city + apiKey
        return urlStr
    }
    
}
