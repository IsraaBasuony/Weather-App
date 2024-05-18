//
//  Current.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Current: Codable, Identifiable {
    let id = UUID()
    let lastUpdated: String
    let tempC: Double
    let condition: Condition
    let pressureMB: Double
    let humidity: Int
    let feelslikeC: Double
    let visKM: Double
    
    init() {
        self.lastUpdated = ""
        self.tempC = 0.0
        self.condition = Condition()
        self.pressureMB = 0.0
        self.humidity = 0
        self.feelslikeC = 0.0
        self.visKM = 0.0
    }
    
    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
        case pressureMB = "pressure_mb"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
        case id
        }
}

