//
//  HomeViewModel.swift
//  WeatherDaily
//
//  Created by Israa on 18/05/2024.
//

import Foundation
import CoreLocation
class HomeViewModel : NSObject, CLLocationManagerDelegate, ObservableObject{
    var loctionManager  = CLLocationManager()
    var networkManager: NetworkManager?
    var bindResultToViewController : (()->()) = {}
    @Published var weather : Weather?
    
    init(networkManager: NetworkManager?) {
        self.networkManager = networkManager
        super.init()
        getPermission()
    }
    
    func getPermission () {
        self.loctionManager.delegate = self
        self.loctionManager.startUpdatingLocation()
        self.loctionManager.requestWhenInUseAuthorization()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = (locations.first?.coordinate)!
        self.fetchDataFromApi(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
    }
    
    func fetchDataFromApi(latitude : Double , longitude : Double){
        
        let url = URLManager.getURL(longitudeAndLatitude: (longitude, latitude ))
        print(url)
        networkManager?.fetchWeatherData(url: url, type: Weather.self, completionHandler: { weather in
            self.weather = weather
        })
    }
    
}
