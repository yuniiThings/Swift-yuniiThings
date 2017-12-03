//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Jong-Yun on 2017. 12. 3..
//  Copyright © 2017년 Jong-Yun. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
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
        /*
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        }
        else {
            celsiusLabel.text = "???"
        }
         */
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            // celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.editingString(for: value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    // 델리게이트 더해야함...
    private func textField(textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        /*
        print("Current text: \(String(describing: textField.text))")
        print("Replacement text: \(string)")
        
        return true
         */
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil
            && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            return true
        }
    }
    
}

/*
protocol UITextFieldDelegate: NSObjectProtocol {
    optional func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    optional func textFieldDidBeginEditing(textField: UITextField)
    optional func textFieldShouldEndEditing(textField: UITextField) -> Bool
    optional func textFiledDidEndEditing(textField: UITextField)
    optional func textField(textField: UITextField,
                            shouldChangeCharacterInRange range: NSRange,
                            replacementString: String) -> Bool
    optional func textFieldShouldClear(textField: UITextField) -> Bool
    optional func textFieldShouldReturn(textField: UITextField) -> Bool
}
 */
