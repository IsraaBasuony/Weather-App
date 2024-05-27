//
//  3DaysForecastTable.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI

struct ThreeDaysForecastTable: View {
    var forecastOf3Days: [Forecastday]?
    var isMorning: Bool
        var body: some View {
            VStack {
                HStack  {
                    MyCustomText(text: "3-Days Forecast:", size: 16, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                        .foregroundColor( .black )
                    Spacer()
                }
                Divider()
                    .background(Color.black)
                
                ForEach(0..<3, id: \.self) { index in
                    if let forecastDay = forecastOf3Days?[index] {
                        
                        NavigationLink(destination: DayDetailsView(hoursInDay: forecastDay.hour )) {
                            DayCell(forecastday: forecastDay, isMorning: isMorning)
                        }
                        .accentColor(.clear)
                        
                    } else {
                        NavigationLink(destination: DayDetailsView(hoursInDay: [])) {
                            DayCell(forecastday: Forecastday(), isMorning: isMorning)
                        }
                        .accentColor(.clear)
                    
                    }
                    if index < 2 {
                        Divider()
                            .background(Color.black)
                    }
                }
            }
            .frame(width: 320)
        }
    }

    #Preview {
ThreeDaysForecastTable(forecastOf3Days: [Forecastday()], isMorning: true)

    }

