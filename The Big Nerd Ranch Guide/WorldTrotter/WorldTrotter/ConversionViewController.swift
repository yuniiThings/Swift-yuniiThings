//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jong-Yun on 2017. 12. 3..
//  Copyright © 2017년 Jong-Yun. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double?
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        // celsiusLabel.text = textField.text
        
        // if let text = textField.text where !text.isEmpty {
        // where을 ,로 변경하라는 메세지가 나옴. swift 버전 문제인지?
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = "\(value)"
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
}
