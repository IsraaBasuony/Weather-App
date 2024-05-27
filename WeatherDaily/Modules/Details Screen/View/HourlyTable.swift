//
//  HourlyTable.swift
//  WeatherDaily
//
//  Created by Israa on 20/05/2024.
//

import SwiftUI

struct HourlyTable: View {
    
    var hours: [Hour]
    var isMorning: Bool
    
    var body: some View {
        VStack {
            ForEach(MyDateFormatter.getDisplayedHoursOfDay(hours: hours)) { item in
                if item.id == MyDateFormatter.getDisplayedHoursOfDay(hours: hours).first?.id {
                    HourlyCell(hour: item, isNow: true, isMorning: isMorning)
                } else {
                    HourlyCell(hour: item, isNow: false, isMorning: isMorning)
                }
            }
        }
    }
}

#Preview {
    HourlyTable(hours: [], isMorning: true)
}
