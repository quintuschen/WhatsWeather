//
//  HourlyForecastView.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import SwiftUI
import Foundation

struct HourlyForecastView: View {
    @EnvironmentObject var city: City
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 30) {
                ForEach(city.weather?.forecasts[...7] ?? []) { forecast in
                    VStack {
                        Text(forecast.shortTime)
                        forecast.summary[0].icon.image
                        Text("\(String(format:"%.0f", (forecast.detail.temperature)))°")
                            .allowsTightening(true)
                    }
                }
            }
            .font(.headline)
            .padding()
        }.padding([.leading, .trailing])
    }
}

#if DEBUG
struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}
#endif
