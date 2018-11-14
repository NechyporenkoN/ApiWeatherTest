//
//  Structs.swift
//  TestParsJSON
//
//  Created by Nikita Nechyporenko on 06.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import UIKit

struct WeatherTodayData: Decodable {
    
    var weather: [Weather]
    var main: Main?
    var wind: Wind?
    var name: String?
}

struct WeatherData: Decodable {
    
    var cod: String?
    var list: [List]?
    var city: City?
}

struct List: Decodable {
    
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var wind: Wind?
    var dt_txt: String?
    //    var rain: Double?
}

struct Main: Decodable {
    
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var humidity: Double?
}

struct Weather: Decodable {
    
    var main: String?
    var icon: String?
}

struct Wind: Decodable {
    
    var speed: Double?
    var deg: Double?
}

struct City: Decodable {
    
    var name: String?
}
