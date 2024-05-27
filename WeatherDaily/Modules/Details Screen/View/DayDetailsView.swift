//
//  DayDetailsView.swift
//  WeatherDaily
//
//  Created by Israa on 20/05/2024.
//

import SwiftUI

struct DayDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var hoursInDay: [Hour]
    var isMorning : Bool = MyDateFormatter.checkDayOrNight()
    
    
    var body: some View {
        ZStack{
            Image(isMorning ? .morningBK : .eveningBK)
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .aspectRatio(1, contentMode: .fit)
            
            ScrollView{
                VStack{
                    HourlyTable(hours: hoursInDay,isMorning: isMorning)
                        .padding(EdgeInsets(top: 80, leading: 0, bottom: 16, trailing: 0))
                    Spacer()
                }
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                           dismiss()
                       }) {
                           Image(systemName: "chevron.left")
                               .font(.title2)
                               .foregroundColor(isMorning ? .black : .white)
                       }
            }
                        
        }
        .onAppear(){
        }
    }
}

#Preview {
    DayDetailsView(hoursInDay: [])
}
