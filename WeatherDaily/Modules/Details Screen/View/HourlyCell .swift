//
//  HourlyCell .swift
//  WeatherDaily
//
//  Created by Israa on 20/05/2024.
//

import SwiftUI
import Kingfisher

struct HourlyCell: View {
    var hour: Hour
    var isNow: Bool
    var isMorning: Bool
    var body: some View {
        HStack{
            Spacer()
            MyCustomText(text: MyDateFormatter.getHourFormat(dateTime: hour.time, isUpcoming: isNow), size: 22, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                .foregroundColor(isMorning ? .black : .white)
                .frame(width: 100, alignment: .leading)
            
            Spacer()
            Spacer()
            let url = URL(string: "https:\(hour.condition.icon )")
            KFImage( url)   
                .resizable()
                .frame(width: 48, height: 48)
            
            Spacer()
            Spacer()
            MyCustomText(text: "\(Int(hour.tempC))°", size: 24, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                .foregroundColor(isMorning ? .black : .white)
            Spacer()
        }
        .padding()
        .frame(height: 60)
        
    }
}

#Preview {
    HourlyCell(hour: Hour(), isNow: false,isMorning: true)
}
