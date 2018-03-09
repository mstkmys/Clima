//
//  WeatherViewController.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let weatherView: WeatherView = {
       
        let weatherView = WeatherView(frame: UIScreen.main.bounds)
        weatherView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        
        return weatherView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add View
        [weatherView].forEach{ self.view.addSubview($0) }
        
        setNavigationController()
        
    }
    
    // MARK: Methods
    
    private func setNavigationController() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }

}













