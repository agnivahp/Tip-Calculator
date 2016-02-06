//
//  ViewController.swift
//  Tip Calc
//
//  Created by Agnivah Poddar on 2/4/16.
//  Copyright © 2016 Agnivah Poddar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sharedisplay: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        billField.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        let themeval = defaults.boolForKey("themeval")
        
        let defshare = Int(defaults.integerForKey("defshare"))
        sharedisplay.text = "\(defshare)"
        
        if(themeval==true){
            self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
        }
        else{
            self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        print("User Editing Bill")
        var Percentages = [0.18, 0.2, 0.22]
        var Percentage = Percentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
       
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = Double(defaults.integerForKey("defshare"))
       // print(intValue)
        
        var tipAmount = Percentage*billAmount
        var totalAmount = (tipAmount+billAmount)/(intValue)
     
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(totalAmount)"
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
        
       
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defperc")
        tipControl.selectedSegmentIndex = intValue
        let defshare = Int(defaults.integerForKey("defshare"))
        sharedisplay.text = "\(defshare)"
            
            let themeval = defaults.boolForKey("themeval")
            
            
            if(themeval==true){
                self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
            }
            else{
                self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
            }
        var Percentages = [0.18, 0.2, 0.22]
        var Percentage = Percentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        
   
        let intValue2 = Double(defaults.integerForKey("defshare"))
        
        
        var tipAmount = Percentage*billAmount
        var totalAmount = (tipAmount+billAmount)/(intValue2)
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(totalAmount)"
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)


        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    @IBAction func onpinch(sender: AnyObject) {
        
        var Percentages = [0.18, 0.2, 0.22]
        var Percentage = Percentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text!).doubleValue
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var intValue2 = Double(defaults.integerForKey("defshare"))
        
        intValue2 = intValue2+1
        defaults.setObject(intValue2, forKey: "defshare")
        var tipAmount = Percentage*billAmount
        var totalAmount = (tipAmount+billAmount)/(intValue2)
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(totalAmount)"
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

