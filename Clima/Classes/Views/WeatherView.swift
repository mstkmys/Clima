//
//  WeatherView.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add Views
        [].forEach{ self.addSubview($0) }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout
    override func layoutSubviews() {
        
        
        
    }
    
}



















