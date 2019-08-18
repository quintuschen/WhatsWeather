//
//  WeatherData.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    var city: CityData
    var forecasts: [HourlyForecast]
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case forecasts = "list"
    }
}

struct HourlyForecast: Codable, Identifiable {
    var id: Date {
        return Date(timeIntervalSince1970: time)
    }
    
    var shortTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: id)
    }
    
    var weekDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: id)
    }
    
    var time: Double
    var summary: [WeatherSummary]
    var detail: WeatherDetail
    var wind: Wind
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case summary = "weather"
        case detail = "main"
        case wind = "wind"
    }
}

struct WeatherSummary: Codable {
    var weather: String
    var description: String
    var iconId: String
    var icon: Icon {
        return Icon(rawValue: weather)!
    }
    
    enum CodingKeys: String, CodingKey {
        case weather = "main"
        case description = "description"
        case iconId = "icon"
    }
}

struct WeatherDetail: Codable {
    var temperature: Double
    var minTemperature: Double
    var maxTemperature: Double
    var humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity = "humidity"
    }
}

struct Wind: Codable {
    var speed: Double
    var deg: Double
}
