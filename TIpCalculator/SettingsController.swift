//
//  SettingsController.swift
//  TIpCalculator
//
//  Created by Golak Sarangi on 8/25/15.
//  Copyright (c) 2015 Golak Sarangi. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func setDefaultTip(sender: UISegmentedControl) {
        var selectedTipIndex = tipControl.selectedSegmentIndex
        var userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(selectedTipIndex, forKey: "selectedTipIndex")
        userDefaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var selectedTipIndex: Int! = userDefaults.integerForKey("selectedTipIndex")
        if (selectedTipIndex != nil) {
            tipControl.selectedSegmentIndex = selectedTipIndex
        } else {
            tipControl.selectedSegmentIndex = 0
        }
    }
}
