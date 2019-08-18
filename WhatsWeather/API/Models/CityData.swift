//
//  CityData.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import Foundation

struct CityData: Codable {
    var name: String
    var coord: Coordinate
    var country: String
    struct Coordinate: Codable {
        var lat: Double
        var lon: Double
    }
}
