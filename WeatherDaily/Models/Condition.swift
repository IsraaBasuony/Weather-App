//
//  Condition.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation

struct Condition: Codable, Identifiable {
    let id = UUID()
    let text: String
    let icon: String
    let code: Int
    
    init() {
        self.text = ""
        self.icon = ""
        self.code = 0
    }
    enum CodingKeys: String, CodingKey {
        case text, icon, code, id
        }
}
