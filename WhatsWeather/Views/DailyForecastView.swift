//
//  DailyForecastView.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import SwiftUI

struct DailyForecastView: View {
    @EnvironmentObject var city: City
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
            
                ForEach(city.weather?.forecasts ?? []) { forecast in
                    if forecast.shortTime == "12" {
                        HStack {
                            Text(forecast.weekDay)
                            Spacer()
                            Text("\(String(format:"%.0f", (forecast.detail.maxTemperature)))°")
                                .allowsTightening(true)
                            Text("\(String(format:"%.0f", (forecast.detail.minTemperature)))°")
                                .foregroundColor(Color.gray)
                                .allowsTightening(true)
                            forecast.summary[0].icon.image
                        }
                    }
                }
            }
            .font(.headline)
            .padding()
        }.padding([.leading, .trailing])
    }
}

#if DEBUG
struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView()
    }
}
#endif
