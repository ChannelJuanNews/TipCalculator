//
//  ViewController.swift
//  TipPro
//
//  Created by Juan Ruelas on 6/20/16.
//  Copyright © 2016 RuelasIndustries. All rights reserved.
//

import UIKit


    

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!

    
    @IBAction func calculateTip(sender: AnyObject) {
        print ("Button is pressed!")
        
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.10
        case 1:
            tipPercentage = 0.15
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
        
        print(totalAmountField.text)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() /*This ensures that our view loaded*/
        self.billAmountField.delegate = self /*we select our text field that we want*/
        self.billAmountField.keyboardType = UIKeyboardType.DecimalPad /*We make sure that the keyboard is a numapad*/
        
        self.tipAmountField.userInteractionEnabled = true
        self.tipAmountField.enabled = false
        
        self.totalAmountField.userInteractionEnabled = true
        self.totalAmountField.enabled = false
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
    }

    func dismissKeyboard(){ /*this is a void function*/
        billAmountField.resignFirstResponder() /*This will dismiss our keyboard*/
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    

    

}

