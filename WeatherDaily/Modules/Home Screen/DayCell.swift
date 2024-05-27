//
//  DayCell.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct DayCell: View {

    var forecastday: Forecastday
    var isMorning: Bool
    var body: some View {
        HStack{
            MyCustomText(text: MyDateFormatter.isToday(date: forecastday.date), size: 22, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                .foregroundColor( .black )
                .frame(width: 70, alignment: .leading)
            
            Spacer()
            let url = URL(string: "https:\(forecastday.day.condition.icon )")
            KFImage( url)   .resizable()
                .frame(width: 48, height: 48)
            
            Spacer()
            
            MyCustomText(text: "\(Int(forecastday.day.mintempC))˚/\(Int(forecastday.day.maxtempC))˚", size: 22, fontstyle: "ChakraPetch-Regular",isMorning: isMorning)
                .foregroundColor( .black )
                .frame(width: 80, alignment: .leading)


        }
        .padding(.horizontal, 4)
        .frame(height: 42)
    }
}

#Preview {
    DayCell(forecastday: Forecastday(), isMorning: true)
}

