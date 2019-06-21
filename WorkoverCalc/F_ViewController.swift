//
//  F_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class F_ViewController: UIViewController {
    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var burstOfCasing: UITextField!
    @IBOutlet weak var weakestSectionTVD: UITextField!
    @IBOutlet weak var internalFluidDensity: UITextField!
    @IBOutlet weak var externalFluidDensity: UITextField!
    @IBOutlet weak var safetyFactor: UITextField!
    @IBOutlet weak var feetLabel: UILabel!
    @IBOutlet weak var swithToMeters: UISwitch!
    
    @IBOutlet weak var resultSurfacePressure: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.applyDesign()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        if burstOfCasing.text == "" || weakestSectionTVD.text == "" || internalFluidDensity.text == "" || externalFluidDensity.text == "" || safetyFactor.text == "" {
            resultSurfacePressure.text = String("Fill out all cells first!")
        } else {
            var firstValue = Double(burstOfCasing.text!)
            var secondValue = Double(weakestSectionTVD.text!)
            var thirdValue = Double(internalFluidDensity.text!)
            var fourthValue = Double(externalFluidDensity.text!)
            var fifthValue = Double(safetyFactor.text!)
            
            let num = NumberFormatter()
            
            var value1 = burstOfCasing.text!
            var value2 = weakestSectionTVD.text!
            var value3 = internalFluidDensity.text!
            var value4 = externalFluidDensity.text!
            let value5 = safetyFactor.text!
            
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
            
            
            if swithToMeters.isOn {
                feetLabel.text = String("ft")
                
                let outputValue1 = 0.052 * secondValue! * (fourthValue! - thirdValue!) + fifthValue! * firstValue!/100
                
                resultSurfacePressure.text = String (format: "Surface pressure w/SF applied: %.0f psi", outputValue1)
                
                
            } else {
                feetLabel.text = String("m")
                
                
                let outputValue1 = 0.052 * 3.281 * secondValue! * (fourthValue! - thirdValue!) + fifthValue! * firstValue!/100
                
                resultSurfacePressure.text = String (format: "Surface pressure w/SF applied: %.0f psi", outputValue1)
                
            }
    }
    

}
    @IBAction func gestureTapped(_ sender: Any) {
        view.endEditing(true)
    }
}
