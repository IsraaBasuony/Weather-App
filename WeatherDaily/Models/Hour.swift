//
//  Hour.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Hour: Codable, Identifiable {
    
    let id = UUID()
    let time: String
    let tempC: Double
    let condition: Condition
    
    init() {
        self.time = ""
        self.tempC = 0.0
        self.condition = Condition()
    }
    
    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case condition
        case id
        
    }
}
