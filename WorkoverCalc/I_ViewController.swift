//
//  I_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit



class I_ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var maxBitWeight: UITextField!
    @IBOutlet weak var mudWeight: UITextField!
    @IBOutlet weak var maxInclination: UITextField!
    @IBOutlet weak var safetyFactor: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.applyDesign()
        // Do any additional setup after loading the view.
    }

    func cosd(degrees: Double) -> Double {
        return cos(degrees * .pi / 180.0)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        if maxBitWeight.text == "" || mudWeight.text == "" || maxInclination.text == "" || safetyFactor.text == "" {
            outputLabel.text = String("Fill out all cells first.")
        } else {
            var firstValue = Double(maxBitWeight.text!)
            var secondValue = Double(mudWeight.text!)
            var thirdValue = Double(maxInclination.text!)
            var fourthValue = Double(safetyFactor.text!)
            
            let num = NumberFormatter()
            
            var value1 = maxBitWeight.text!
            var value2 = mudWeight.text!
            var value3 = maxInclination.text!
            var value4 = safetyFactor.text!
            
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
            
            firstValue = Double(truncating: num.number(from: value1)!)
            secondValue = Double(truncating: num.number(from: value2)!)
            thirdValue = Double(truncating: num.number(from: value3)!)
            fourthValue = Double(truncating: num.number(from: value4)!)
            
            
            
            let outputValue = (firstValue! * (1 + fourthValue! / 100)) / (((65.44 - secondValue!) / 65.44) * cosd(degrees: thirdValue!))
            
            
            outputLabel.text = String (format: "Requred DC air weight: %.0f lbs", outputValue)
        }
    }
    
}
