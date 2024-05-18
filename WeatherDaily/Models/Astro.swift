//
//  Astro.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Astro: Codable, Identifiable {
    let id = UUID()
    let sunrise, sunset: String

    init() {
        self.sunrise = ""
        self.sunset = ""
    }
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, id
    }
}
