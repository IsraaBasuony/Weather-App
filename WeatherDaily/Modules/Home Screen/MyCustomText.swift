//
//  MyCustomText.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI

struct MyCustomText: View {
    var text: String
    var size: CGFloat
    var fontstyle:String
    var isMorning:Bool
    var body: some View {
        Text(text)
            .foregroundStyle(isMorning ? .black : .white)
            .font(.custom(fontstyle, size: size))
    }
}

#Preview {
    MyCustomText(text: "Alex", size: 36, fontstyle: "ChakraPetch-SemiBold", isMorning: true)
}

