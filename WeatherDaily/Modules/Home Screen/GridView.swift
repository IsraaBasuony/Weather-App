//
//  GridView.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI
struct GridView: View {
    
    var current: Current?
    var isMorning: Bool
    var body: some View {
        
        Grid (horizontalSpacing: 64, verticalSpacing: 18){
            
            GridRow {
                GridItem(type: "VISIBILITY", value: "\(Int(current?.visKM ?? 0.0)) KM", isMorning: isMorning)
                GridItem(type: "HUMIDITY", value: "\(current?.humidity ?? 0)%", isMorning:  isMorning)
            }
            
            GridRow {
                GridItem(type: "FEELS LIKE", value: "\(Int(current?.tempC ?? 0.0))˚C", isMorning: isMorning)
                GridItem(type: "PRESSURE", value: "\(Int(current?.pressureMB ?? 0.0))", isMorning: isMorning)
            }
        }
        .onAppear{
            
        }
    }
}


#Preview {
    GridView(current: Current(), isMorning: true)
}

