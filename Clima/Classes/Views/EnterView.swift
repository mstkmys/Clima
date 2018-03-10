//
//  EnterView.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class EnterView: UIView {
    
    let getWeatherLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Get Weather"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        
        return label
        
    }()
    
    let enterTextField: UITextField = {
       
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Enter City Name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        
        return textField
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [getWeatherLabel, enterTextField].forEach{ self.addSubview($0) }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout
    override func layoutSubviews() {
        
        getWeatherLabel.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            size: .init(width: 0, height: 80)
        )
        getWeatherLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        enterTextField.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: getWeatherLabel.topAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 50, bottom: 0, right: 50),
            size: .init(width: 0, height: 50)
        )
        
    }

}













