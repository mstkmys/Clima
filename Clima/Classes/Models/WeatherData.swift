//
//  WeatherData.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class WeatherData {
    
    var temperature: Int = 0
    var condition: Int = 0
    var city: String = ""
    var weatherIcon: UIImage = UIImage()
    
    func updataWeatherIcon(condition: Int) -> UIImage {
        
        switch condition {
            
        case 0...300:
            return #imageLiteral(resourceName: "tstorm1")
            
        case 301...500:
            return #imageLiteral(resourceName: "light_rain")
            
        case 501...600:
            return #imageLiteral(resourceName: "shower3")
            
        case 601...700:
            return #imageLiteral(resourceName: "snow4")
            
        case 701...771:
            return #imageLiteral(resourceName: "fog")
            
        case 772...800:
            return #imageLiteral(resourceName: "tstorm3")
            
        case 800:
            return #imageLiteral(resourceName: "sunny")
            
        case 801...804:
            return #imageLiteral(resourceName: "cloudy2")
            
        case 900...903, 905...1000:
            return #imageLiteral(resourceName: "tstorm3")
            
        case 903:
            return #imageLiteral(resourceName: "snow5")
            
        case 904:
            return #imageLiteral(resourceName: "sunny")
            
        default:
            return UIImage()
            
        }
        
    }
    
}
























