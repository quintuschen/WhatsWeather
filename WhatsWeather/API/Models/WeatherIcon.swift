//
//  WeatherIcon.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import Foundation
import SwiftUI

extension WeatherSummary {
    enum Icon: String, Codable {
        case thunderstorm = "Thunderstorm"
        case drizzle = "Drizzle"
        case rain = "Rain"
        case snow = "Snow"
        case clear = "Clear"
        case clouds = "Clouds"
        case atmosphere = "Atmosphere"
        
        var image: Image {
            switch self {
            case .thunderstorm:
                return Image(systemName: "cloud.bolt")
            case .drizzle:
                return Image(systemName: "cloud.drizzle")
            case .rain:
                return Image(systemName: "cloud.rain")
            case .snow:
                return Image(systemName: "cloud.snow")
            case .clear:
                return Image(systemName: "sun.max")
            case .clouds:
                return Image(systemName: "cloud")
            case .atmosphere:
                return Image(systemName: "cloud.fog")
            }
        }
    }
}
