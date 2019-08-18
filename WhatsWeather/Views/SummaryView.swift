//
//  SummaryView.swift
//  WhatsWeather
//
//  Created by Quintus Chen on 18/08/19.
//  Copyright © 2019 Quintum. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var city: City

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(city.name)
                .allowsTightening(true)
                .padding()
            HStack {
                Text("\(String(format:"%.0f", (city.weather?.forecasts[0].detail.temperature ?? 0.0)))°")
                    .font(.system(size: 100))
                VStack {
                    HStack {
                        Image(systemName: "thermometer.sun")
                        Text("\(String(format:"%.0f", (city.weather?.forecasts[0].detail.maxTemperature ?? 0.0)))°")
                    }.foregroundColor(Color.red)
                    HStack {
                        Image(systemName: "thermometer.snowflake")
                        Text("\(String(format:"%.0f", (city.weather?.forecasts[0].detail.minTemperature ?? 0.0)))°")
                    }.foregroundColor(Color.blue)
                }.font(.title)
            }.padding()
            HStack {
                city.weather?.forecasts[0].summary[0].icon.image ?? Image(systemName: "xmark.octagon")
                Text(city.weather?.forecasts[0].summary[0].description ?? "--")
                    .allowsTightening(true)
            }.font(.subheadline)
        }.shadow(radius: 5)
    }
}

#if DEBUG
struct SummaryView_Previews: PreviewProvider {

//    let cityData = CityData(name: "Wellington", coord: CityData.Coordinate(lat: 100.0, lon:100.0), country: "New Zealand")
    static var previews: some View {
        SummaryView()
    }
}
#endif
