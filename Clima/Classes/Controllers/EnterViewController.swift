//
//  EnterViewController.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {
    
    let enterView: EnterView = {
       
        let enterView = EnterView(frame: UIScreen.main.bounds)
        enterView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "cityBackground"))
        enterView.contentMode = .scaleAspectFit
        
        return enterView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Views
        [enterView].forEach{ self.view.addSubview($0) }
        
    }

}













