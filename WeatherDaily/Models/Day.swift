//
//  Day.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Day: Codable, Identifiable {
    let id = UUID()
    let maxtempC, mintempC: Double
    let condition: Condition
    
    init() {
        self.maxtempC = 0.0
        self.mintempC = 0.0
        self.condition = Condition()
    }
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition, id
    }
}
