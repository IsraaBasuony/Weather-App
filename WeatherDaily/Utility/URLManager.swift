//
//  URLManager.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation
class URLManager{
    static var baseURL = "https://api.weatherapi.com"
    static var key = "e511cd4f8f22496ea7b112020241805"

    static func getURL( longitudeAndLatitude: (Double,Double)) -> String{
        var result = baseURL + "/v1/forecast.json" +  "?key=" + key + "&q=" + "\(String(longitudeAndLatitude.0)),\(String(longitudeAndLatitude.1))" + "&days=3&aqi=yes&alerts=no"
        return result
    }
    
}
