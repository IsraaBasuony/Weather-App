//
//  ForecastDay.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation
struct Forecast: Codable, Identifiable {
    let id = UUID()
    let forecastday: [Forecastday]
    init(){
        self.forecastday = []
    }
    enum CodingKeys: String, CodingKey {
        case forecastday
        case id
        }
}
