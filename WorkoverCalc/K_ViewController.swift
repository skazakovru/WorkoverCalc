//
//  K_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 6/15/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class K_ViewController: UIViewController {

    private let dataSourse = ["BHA     Bottom Hole Assembly","BHPG     Bottom Hole Pressure Guage","DC     Drill Collar","deg     Degrees","EMW     Equivalent Mud Weight","FIT     Formation Integrity Test","FP     Formation Pressure","ft     feet","HP     Hydraustatic Pressure","ID     Inside Diameter","in     Inches","KWM     Kill Weight Mud","lbs     Pounds","m     Meters","OBM     Oil Based Mud","OD     Outside Diameter","OH     Open Hole","PPG     Pounds per Gallon","psi     Pounds per Square Inch","SGS     Static Gradient Survey","SICP     Shut In Casing Pressure","SITP     Shut In Tubing Pressure","SP     Surface Pressure","TVD     True Vertical Depth","WBM     Water Base Mud","WOB     Weight On Bit","%     Percent"]
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBAction func buttonClicked(_ sender: Any) {
        let urlStr = "https://itunes.apple.com/ru/app/rigfloorcalc/id1223053450?mt=8"
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: urlStr)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.canOpenURL(URL(string: urlStr)!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self

        // Do any additional setup after loading the view.
    }
}

extension K_ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSourse.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        detailLabel.text = dataSourse[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSourse[row]
    }
}


