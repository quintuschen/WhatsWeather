//
//  City.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import SwiftUI
import Combine

class City: ObservableObject {
    var name: String
    
    @Published var weather: WeatherData?
    
    init() {
        self.name = "--"
        self.weather = nil
        self.getWeather()
    }
    
    private func getWeather () {
        NetworkService.getWeather() { (weather) in
            DispatchQueue.main.async {
                self.weather = weather
                self.name = weather?.city.name ?? "--"
            }
        }
    }
}
