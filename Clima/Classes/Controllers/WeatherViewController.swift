//
//  WeatherViewController.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController {
    
    let weatherView: WeatherView = {
       
        let weatherView = WeatherView(frame: UIScreen.main.bounds)
        weatherView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        
        return weatherView
        
    }()
    
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let API_KEY = "d11d0ccee8179c66d525b4529a3bff4f"
    
    // MARK: Properties
    
    let locationManager = CLLocationManager()
    let weatherData = WeatherData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add View
        [weatherView].forEach{ self.view.addSubview($0) }
        
        setNavigationController()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // MARK: Methods
    
    private func setNavigationController() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    // MARK: - Networking
    /**********************************************************************************************/
    private func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            if response.result.isSuccess {
                print("Success get Data.")
                
                let weatherJSON = JSON(response.result.value!)
                self.updataWeatherData(json: weatherJSON)
                
            }
            else {
                print("Error: \(String(describing: response.result.error))")
                self.weatherView.citylabel.text = "Connection Issue"
            }
            
        }
        
    }
    
    // MARK: - JSON Perse
    /**********************************************************************************************/
    private func updataWeatherData(json: JSON) {
        
        guard let tempResult = json["main"]["temp"].double else {
            
            weatherView.citylabel.text = "Weather Unavailable"
            return
            
        }
        
        weatherData.temperature = Int(tempResult - 273.15)
        weatherData.city = json["name"].stringValue
        weatherData.condition = json["weather"][0]["id"].intValue
        weatherData.weatherIcon = weatherData.updataWeatherIcon(condition: weatherData.condition)
        
    }
    
    // MARK: - UpdateUI
    /**********************************************************************************************/

}

// MARK: - CLLocationManagerDelegate
/**********************************************************************************************/
extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params = ["lat": latitude, "lon": longitude, "appid": API_KEY]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Locationmanager Error [\(error)]")
        weatherView.citylabel.text = "Location Unavailable"
        
    }
    
}













