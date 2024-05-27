//
//  NetworkManager.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation
class NetworkManager {
    func fetchWeatherData<T: Codable>(url: String, type: T.Type, completionHandler: @escaping (T?) -> Void) {
        guard let newURL = URL(string: url) else {
            completionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: newURL) { data, response, error in
            guard error == nil else {
                print("Error in network request: \(error!.localizedDescription)")
                completionHandler(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completionHandler(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(result)
            } catch {
                print("Error in decoding process: \(error.localizedDescription)")
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
}
