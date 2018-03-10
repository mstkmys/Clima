//
//  WeatherView.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/09.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    let weatherImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    let citylabel: UILabel = {
       
        let label = UILabel()
        label.text = "Loading..."
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        
        return label
        
    }()
    
    let temperatureLabel: UILabel = {
       
        let label = UILabel()
        label.text = "20°"
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 50)
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add Views
        [citylabel, weatherImageView, temperatureLabel].forEach{ self.addSubview($0) }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout
    override func layoutSubviews() {
        
        citylabel.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 10, left: 10, bottom: 10, right: 10),
            size: .init(width: 0, height: 80)
        )
        
        weatherImageView.anchor(
            top: self.centerYAnchor,
            leading: self.leadingAnchor,
            bottom: citylabel.topAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: -50, left: 50, bottom: 10, right: 50)
        )
        
        temperatureLabel.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: weatherImageView.topAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 10, left: 10, bottom: 10, right: 10),
            size: .init(width: 0, height: 100)
        )
        
    }
    
}



















