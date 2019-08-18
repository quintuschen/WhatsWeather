//
//  NetworkService.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import Foundation

class NetworkService {
    
    static func getWeather(_ completion: @escaping (_ weather: WeatherData?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?APPID=5ad6eb0c16f4d2e9ea3f5411e4aa4aab&q=wellington&units=metric") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let weatherObject = try decoder.decode(WeatherData.self, from: data)
                completion(weatherObject)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
}
