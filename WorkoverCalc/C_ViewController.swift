//
//  C_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class C_ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var shutInTubingPressure: UITextField!
    @IBOutlet weak var fluidDensity: UITextField!
    @IBOutlet weak var topPerfsTVD: UITextField!
    @IBOutlet weak var ftLabel: UILabel!
    
    @IBOutlet weak var switchForMeters: UISwitch!
    @IBOutlet weak var resultKWM: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.applyDesign()
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        if shutInTubingPressure.text == "" || fluidDensity.text == "" || topPerfsTVD.text == ""  {
            resultKWM.text = String("Check your entries!")
        } else {
            
            let num = NumberFormatter()
            num.roundingMode = .up
            num.minimumFractionDigits = 1
            num.maximumFractionDigits = 1
            var value1 = shutInTubingPressure.text!
            if num.number(from:value1) == nil {
                value1 = value1.replacingOccurrences(of: ".", with: ",")
            }
            var value2 = fluidDensity.text!
            if num.number(from:value2) == nil {
                value2 = value2.replacingOccurrences(of: ".", with: ",")
            }
            var value3 = topPerfsTVD.text!
            if num.number(from:value3) == nil {
                value3 = value3.replacingOccurrences(of: ".", with: ",")
            }
        
            let firstValue = Double(truncating: num.number(from: value1)!)
            let secondValue = Double(truncating: num.number(from: value2)!)
            let thirdValue = Double(truncating: num.number(from: value3)!)
            
            if switchForMeters.isOn {
                ftLabel.text = String("ft")
                
                let outputValue = 19.23 * (firstValue + (0.052 * secondValue * thirdValue)) / thirdValue
                
                resultKWM.text = (num.string(from: NSNumber(value: outputValue)) ?? "") + "ppg"
                
                
            } else {
                ftLabel.text = String("m")
                
                let outputValue = 19.23 * (firstValue + (0.052 * secondValue * thirdValue) * 3.281) / (3.281 * thirdValue)
                
                
                resultKWM.text = (num.string(from: NSNumber(value: outputValue)) ?? "") + "ppg"
                
            }
        }
    }
}



