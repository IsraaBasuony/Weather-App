//
//  Weather.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation
struct Weather: Codable, Identifiable {
    let id = UUID()
    let location: Location
    let current: Current
    let forecast: Forecast
    
    init() {
        self.location = Location()
        self.current = Current()
        self.forecast = Forecast()
    }
    
    enum CodingKeys: String, CodingKey {
        case location , current, forecast, id
    }
}
