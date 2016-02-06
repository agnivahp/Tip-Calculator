//
//  SettingsViewController.swift
//  Tip Calc
//
//  Created by Agnivah Poddar on 2/6/16.
//  Copyright © 2016 Agnivah Poddar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var theme: UISwitch!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var defaultPercent: UISegmentedControl!
    @IBOutlet weak var modeLabel: UILabel!
    
    var pickerData = ["1", "2", "3","4","5" ]
    var picker = UIPickerView()
    //@IBOutlet weak var defaultSharing: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        textfield.inputView = picker
       // self.view.backgroundColor = UIColor(hue: 0.5417, saturation: 0.48, brightness: 0.97, alpha: 1.0)
     let defaults = NSUserDefaults.standardUserDefaults()
        let themeval = defaults.boolForKey("themeval")
        theme.on = themeval
        
        if(themeval==true){
            self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
            modeLabel.text = "Dark"
        }
        else{
            self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
            modeLabel.text = "Light"
        }

        
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let stringValue = defaults.objectForKey("defshare") as! String
        let intValue = defaults.integerForKey("defperc")
        textfield.text = stringValue
        defaultPercent.selectedSegmentIndex = intValue
        let themeval = defaults.boolForKey("themeval")
        
        theme.on = themeval
        if(themeval==true){
            self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
             modeLabel.text = "Dark"
        }
        else{
            self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
             modeLabel.text = "Light"
        }

        
    }
    override func viewDidAppear( animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let themeval = defaults.boolForKey("themeval")
                    
              theme.on = themeval
            if(themeval==true){
                    self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
                }
            else{
                    self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
                }

        
    }
    override func viewWillDisappear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let text = textfield.text
        let per = defaultPercent.selectedSegmentIndex
        defaults.setObject(text, forKey: "defshare")
        defaults.setInteger(per, forKey: "defperc")
        
        let thememode = theme.on
        defaults.setBool(thememode, forKey: "themeval")
        defaults.synchronize()

    }
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    
    }
    
 
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfield.text = pickerData[row]
    
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return  pickerData[row]
    }
    
    
    @IBAction func switchpress(sender: UISwitch) {
        //let defaults = NSUserDefaults.standardUserDefaults()
        
       // let themeval = defaults.boolForKey("themeval")
        
        
        if(theme.on==true){
            self.view.backgroundColor = UIColor(hue: 0.5194, saturation: 0.94, brightness: 0.59, alpha: 1.0)
             modeLabel.text = "Dark"
        }
        else{
            self.view.backgroundColor = UIColor(hue: 0.225, saturation: 0.37, brightness: 0.96, alpha: 1.0)
             modeLabel.text = "Light"
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickerkill(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
