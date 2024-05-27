//
//  Location.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Location: Codable, Identifiable {
    let id = UUID()
    let name, country: String
    let lat, lon: Double
    
    init() {
        self.name = ""
        self.country = ""
        self.lat = 30.0412
        self.lon = 31.141219
    }

    enum CodingKeys: String, CodingKey {
        case name, country, lat, lon, id
        
    }
}

