//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by UCode on 11/5/17.
//  Copyright © 2017 Map App. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var Celsius: UILabel!
    @IBOutlet var textField: UITextField!
    
    var farenheitValue: Double? {
        didSet{
            updateCelsius()
        }
    }
    
    var celsiusValue: Double? {
        if let value = farenheitValue {
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    let NumberFormat: NumberFormatter = {
        let nf = NumberFormatter();
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 3
        return nf
    }()
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    @IBAction func FarenheightFieldChange(textField: UITextField){
        //Celsius.text = textField.text;
        if let text = textField.text, let value = Double(text) {
            farenheitValue = value
        }else{
            farenheitValue = nil
        }
    }
    
    func updateCelsius() {
        if let val = celsiusValue {
            Celsius.text = NumberFormat.string(from: NSNumber(value: val))
            
        }
        else{
             Celsius.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let hasDecimalSeparator = textField.text?.range(of: ".")
        let replacementDecimalSeparator = string.range(of: ".")
        
        if hasDecimalSeparator != nil && replacementDecimalSeparator != nil{
            return false
        }else{
            return true
        }
    }
}
