//
//  EnterViewController.swift
//  Clima
//
//  Created by Miyoshi Masataka on 2018/03/10.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

// protocol
protocol EnterDelegate {
    func userEnteredACity(name: String)
}

class EnterViewController: UIViewController {
    
    let enterView: EnterView = {
       
        let enterView = EnterView(frame: UIScreen.main.bounds)
        enterView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "cityBackground"))
        enterView.contentMode = .scaleAspectFit
        
        return enterView
        
    }()
    
    var delegate: EnterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Views
        [enterView].forEach{ self.view.addSubview($0) }
        
        // deledate
        self.enterView.enterTextField.delegate = self
        
    }

}

// MARK: - UITextFieldDelegate
/**********************************************************************************************/
extension EnterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let cityName = textField.text!
        // Set Delegate
        delegate?.userEnteredACity(name: cityName)
        
        enterView.enterTextField.resignFirstResponder()
        self.navigationController?.popViewController(animated: true)
        
        return true
        
    }
    
}













