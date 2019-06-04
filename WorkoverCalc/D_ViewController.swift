//
//  D_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class D_ViewController: UIViewController {
    
    @IBOutlet weak var shutinTP: UITextField!
    @IBOutlet weak var topPerfsTVD: UITextField!
    @IBOutlet weak var fITEMW: UITextField!
    
    @IBOutlet weak var bullheadingKWM: UITextField!
    @IBOutlet weak var formationPressureTopPerfs: UITextField!
    
    @IBOutlet weak var feetLabel: UILabel!
    @IBOutlet weak var switchForMetersTapped: UISwitch!
    
    @IBOutlet weak var initialTubingPressure: UILabel!
    @IBOutlet weak var finalTubingPressure: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if shutinTP.text == "" || topPerfsTVD.text == "" || fITEMW.text == "" || bullheadingKWM.text == "" || formationPressureTopPerfs.text == "" {
            initialTubingPressure.text = String("Fill out all cells with valid numbers.")
        } else {
            var firstValue = Double(shutinTP.text!)
            var secondValue = Double(topPerfsTVD.text!)
            var thirdValue = Double(fITEMW.text!)
            var fourthValue = Double(bullheadingKWM.text!)
            var fifthValue = Double(formationPressureTopPerfs.text!)
            
            let num = NumberFormatter()
            
            var value1 = shutinTP.text!
            var value2 = topPerfsTVD.text!
            var value3 = fITEMW.text!
            var value4 = bullheadingKWM.text!
            let value5 = formationPressureTopPerfs.text!
            
            if num.number(from:value1) == nil {
                value1 = value1.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value2) == nil {
                value2 = value2.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value3) == nil {
                value3 = value3.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value4) == nil {
                value4 = value4.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value5) == nil {
                value4 = value5.replacingOccurrences(of: ".", with: ",")
            }
            
            firstValue = Double(truncating: num.number(from: value1)!)
            secondValue = Double(truncating: num.number(from: value2)!)
            thirdValue = Double(truncating: num.number(from: value3)!)
            fourthValue = Double(truncating: num.number(from: value4)!)
            fifthValue = Double(truncating: num.number(from: value5)!)
            
    
                if switchForMetersTapped.isOn {
                    feetLabel.text = String("ft")
                    
                    let outputValue1 = 0.052 * thirdValue! * secondValue! - firstValue! + fifthValue!
                    let outputValue2 = 0.052 * secondValue! * (thirdValue! - fourthValue!)
                    
                    initialTubingPressure.text = String (format: "Maxumum initial pressure: %.0f psi", outputValue1)
                    finalTubingPressure.text = String (format: "Maximum final pressure: %.0f psi", outputValue2)
                    
                } else {
                    feetLabel.text = String("m")
                    
                    let outputValue3 = 0.052 * thirdValue! * secondValue! * 3.281 - firstValue! + fifthValue!
                    let outputValue4 = 0.052 * secondValue! * 3.281 * (thirdValue! - fourthValue!)
                    
                    initialTubingPressure.text = String (format: "Maxumum initial pressure: %.0f psi", outputValue3)
                    finalTubingPressure.text = String (format: "Maxumum initial pressure: %.0f psi", outputValue4)
                    
                }
            }
    }
    @IBAction func gestureTapped(_ sender: Any) {
        view.endEditing(true)
    }
}


