//
//  Answer.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 06.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import Foundation

class Forecast {
    
    var name: String?
    var temp: Int?
    var tempMin: Double?
    var tempMax: Double?
    var humidity: Int?
    var icon: String?
    var windSpeed: Double?
    var date: String?
    var description: String?
    
    
    init(name: String, temp: Int, tempMin: Double, tempMax: Double, humidity: Int, icon: String, windSpeed: Double, date: String, description: String) {
        self.name = name
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.humidity = humidity
        self.icon = icon
        self.windSpeed = windSpeed
        self.date = date
        self.description = description
    }
}
