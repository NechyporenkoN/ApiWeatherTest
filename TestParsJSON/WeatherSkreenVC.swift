//
//  WeatherSkreenVC.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 07.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class WeatherSkreenVC: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var descriptionWeatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var firstDayDateLabel: UILabel!
    @IBOutlet weak var secondDayDateLabel: UILabel!
    @IBOutlet weak var thirdDayDateLabel: UILabel!
    @IBOutlet weak var fourthDayDateLabel: UILabel!
    @IBOutlet weak var fifthDayDateLabel: UILabel!
    
    @IBOutlet weak var firstDayTempLabel: UILabel!
    @IBOutlet weak var secondDayTempLabel: UILabel!
    @IBOutlet weak var thirdDayTempLabel: UILabel!
    @IBOutlet weak var fourthDayTempLabel: UILabel!
    @IBOutlet weak var fifthDayTempLabel: UILabel!
    
    @IBOutlet weak var iconWeatherImageView: UIImageView!
    
    @IBOutlet weak var firstDayIconImageView: UIImageView!
    @IBOutlet weak var secondDayIconImageView: UIImageView!
    @IBOutlet weak var thirdDayIconImageView: UIImageView!
    @IBOutlet weak var fourthDayIconImageView: UIImageView!
    @IBOutlet weak var fifthDayIconImageView: UIImageView!
    
    
    @IBOutlet weak var firstDayButton: UIButton!
    @IBOutlet weak var secondDayButton: UIButton!
    @IBOutlet weak var thirdDayButton: UIButton!
    @IBOutlet weak var fourthDayButton: UIButton!
    @IBOutlet weak var fifthDayButton: UIButton!
    
    
    //    var cityName = weatherToday[0].name!
    //    var iconWeather = weatherToday[0].icon!
    //    var temperature = weatherToday[0].temp!
    //    var wind = String(weatherToday[0].windSpeed!)
    //    var descriptionWeather = weatherToday[0].description!
    //    var humidity = weatherToday[0].humidity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSkreen()
    }
    
    func setupSkreen() {
        setupSkreenWeatherNow()
        setupSkreenWeatherForecast()
    }
    
    func setupSkreenWeatherNow() {
        cityNameLabel.text = weatherToday[0].name!
        temperatureLabel.text = weatherToday[0].temp! + " \u{00B0}" + "C"
        iconWeatherImageView.image = UIImage(named: weatherToday[0].icon!)
        windLabel.text = String(weatherToday[0].windSpeed!) + "m/s"
        descriptionWeatherLabel.text = weatherToday[0].description!
        humidityLabel.text = weatherToday[0].humidity! + " %"
    }
    
    func setupSkreenWeatherForecast() {
        setupSkreenWeatherFirstDay()
        setupSkreenWeatherSecondDay()
        setupSkreenWeatherThirdDay()
        setupSkreenWeatherFourthDay()
        setupSkreenWeatherFifthDay()
    }
    
    func setupSkreenWeatherFirstDay() {
        firstDayTempLabel.text = forecastOnFiveDays[0].temp! + " \u{00B0}" + "C"
        firstDayIconImageView.image = UIImage(named: forecastOnFiveDays[0].icon!)
    }
    
    func setupSkreenWeatherSecondDay() {
        secondDayTempLabel.text = forecastOnFiveDays[1].temp! + " \u{00B0}" + "C"
        secondDayIconImageView.image = UIImage(named: forecastOnFiveDays[1].icon!)
    }
    
    func setupSkreenWeatherThirdDay() {
        thirdDayTempLabel.text = forecastOnFiveDays[2].temp! + " \u{00B0}" + "C"
        thirdDayIconImageView.image = UIImage(named: forecastOnFiveDays[2].icon!)
    }
    
    func setupSkreenWeatherFourthDay() {
        fourthDayTempLabel.text = forecastOnFiveDays[3].temp! + " \u{00B0}" + "C"
        fourthDayIconImageView.image = UIImage(named: forecastOnFiveDays[3].icon!)
    }
    
    func setupSkreenWeatherFifthDay() {
        fifthDayTempLabel.text = forecastOnFiveDays[4].temp! + " \u{00B0}" + "C"
        fifthDayIconImageView.image = UIImage(named: forecastOnFiveDays[4].icon!)
    }
}
