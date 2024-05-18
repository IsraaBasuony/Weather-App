//
//  ForecastDay.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Forecastday: Codable, Identifiable {
    let id = UUID()
    let date: String
    let day: Day
    let astro: Astro
    let hour: [Hour]
    
    init(){
        self.date = ""
        self.day = Day()
        self.astro = Astro()
        self.hour = []
    }

    enum CodingKeys: String, CodingKey {
        case date
        case day, astro, hour
        case id
    }
}
