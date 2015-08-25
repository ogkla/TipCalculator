//
//  ViewController.swift
//  TIpCalculator
//
//  Created by Golak Sarangi on 8/21/15.
//  Copyright (c) 2015 Golak Sarangi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipPercent: Int = 15
    var tipPercentsList = [15, 20, 25]
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func startEditing(sender: AnyObject) {
        if amountField.text == "$" {
            amountField.text = ""
        }
    }

    @IBOutlet weak var totalValueLabel: UILabel!
    @IBAction func changeTipPercent(sender: UISegmentedControl) {
        self.calculateTip();
    }


    @IBAction func ValueEditingChanged(sender: UITextField) {
        self.calculateTip();
    }
    
    private func calculateTip() {
        tipPercent = tipPercentsList[tipControl.selectedSegmentIndex]
        if var value = amountField.text?.toInt() {
            var tipValue = Double(value * tipPercent)/100
            resultLabel.text = "$\(tipValue)"
            var totalValue = tipValue + Double(value)
            totalValueLabel.text = "$\(totalValue)"
        } else {
            totalValueLabel.text = "$0";
            resultLabel.text = "$0";
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountField.becomeFirstResponder()
    }

    override func viewWillAppear(animated: Bool) {
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var selectedTipIndex: Int! = userDefaults.integerForKey("selectedTipIndex")
        if (selectedTipIndex != nil) {
            tipControl.selectedSegmentIndex = selectedTipIndex
        } else {
            tipControl.selectedSegmentIndex = 0
        }
        calculateTip();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

