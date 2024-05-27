//
//  CurrentWeather.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct CurrentWeather: View {
    

    var weather: Weather?
    var isMorning:Bool
    
    var body: some View {
        VStack(alignment: .center){
            MyCustomText(text:  weather?.location.name ?? "UnKnown", size: 36, fontstyle: "ChakraPetch-SemiBold",isMorning: isMorning)
            
            MyCustomText(text:"\(Int( weather?.current.tempC ?? 0.0))˚C", size:56, fontstyle: "ChakraPetch-SemiBold", isMorning: isMorning)
            
            MyCustomText(text: weather?.current.condition.text ??
                        " ", size: 32, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
            HStack{
                Spacer()
                MyCustomText(text: "H:", size: 28, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                
                MyCustomText(text: "\(Int (weather?.forecast.forecastday[0].day.maxtempC ?? 0.0))˚C", size: 28, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                Spacer()
                MyCustomText(text: "L:", size: 28, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                
                MyCustomText(text:"\(Int(weather?.forecast.forecastday[0].day.mintempC ?? 0.0))˚C", size: 28, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                Spacer()
                
            }.padding(.vertical, 2)
                
            let url = URL(string: "https:\(weather?.current.condition.icon ?? "")")
            KFImage( url)
                .frame(width: 60, height: 60)
            
            MyCustomText(text: MyDateFormatter.formattedDate(from:  weather?.current.lastUpdated ??  "2024-05-22 18:37" )!, size: 16, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                .padding(.top, -10)
        }    }
}

#Preview {
    
    CurrentWeather(weather: Weather(), isMorning: true)
}
