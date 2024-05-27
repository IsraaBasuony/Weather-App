//
//  GridItem.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI

struct GridItem: View {
    var type : String
    var value : String
    var isMorning : Bool
    var body: some View {
            VStack{
                MyCustomText(text: type, size: 18, fontstyle: "ChakraPetch-Regular", isMorning: isMorning)
                    .padding(.bottom, 2)
                MyCustomText(text:value, size: 24,fontstyle: "ChakraPetch-SemiBold", isMorning: isMorning)
                    
            }
    
    }
}

#Preview {
    GridItem(type: "HUMIDITY", value: "30%", isMorning: true)
}

