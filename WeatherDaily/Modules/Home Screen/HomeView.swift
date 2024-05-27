//
//  HomeView.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    private let isMorning = MyDateFormatter.checkDayOrNight()
    @StateObject private var viewModel = HomeViewModel(networkManager: NetworkManager())
    
    @State private var weather  : Weather?
    var body: some View {
        NavigationView{
            
            ZStack{
                Image( isMorning ? .morningBK : .eveningBK)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                    .aspectRatio(1.5, contentMode: .fit)
                
                VStack{
                    Spacer()
                    Spacer()
                    CurrentWeather(weather: viewModel.weather, isMorning: isMorning)
                    Spacer()
                    ThreeDaysForecastTable(forecastOf3Days: viewModel.weather?.forecast.forecastday, isMorning: isMorning)
                    Spacer()
                    GridView(current: viewModel.weather?.current, isMorning: isMorning)
                    
                    MyCustomText(text: "powerd by Weather Api", size: 12, fontstyle: "ChakraPetch-Light", isMorning: isMorning)
                    Spacer()
                    Spacer()
                    
                }
            }
            
            .onAppear(){
                weather = viewModel.weather
            }
        }
    }
}

#Preview {
    HomeView()
}
