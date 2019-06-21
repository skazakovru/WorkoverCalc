//
//  H_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class H_ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    
    
    @IBOutlet weak var shearRating: UITextField!
    @IBOutlet weak var pinsInstalled: UITextField!
    @IBOutlet weak var errorPerPin: UITextField!
    @IBOutlet weak var hydraustaticHead: UITextField!
    @IBOutlet weak var bottomHP: UITextField!
    
    @IBOutlet weak var minSurPressure: UILabel!
    @IBOutlet weak var maxFurPressure: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        mainButton.applyDesign()
    }
    
    @IBAction func calculateButtonTouched(_ sender: Any) {
        
        if shearRating.text == "" || pinsInstalled.text == "" || errorPerPin.text == "" || hydraustaticHead.text == "" || bottomHP.text == "" {
            minSurPressure.text = String("Fill out all cells first!")
        } else {
            var firstValue = Double(shearRating.text!)
            var secondValue = Double(pinsInstalled.text!)
            var thirdValue = Double(errorPerPin.text!)
            var fourthValue = Double(hydraustaticHead.text!)
            let fifthValue = Double(bottomHP.text!)
            
            let num = NumberFormatter()
            
            var value1 = shearRating.text!
            var value2 = pinsInstalled.text!
            var value3 = errorPerPin.text!
            var value4 = hydraustaticHead.text!
            var value5 = bottomHP.text!
            
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
                value5 = value5.replacingOccurrences(of: ".", with: ",")
            }
            
            firstValue = Double(truncating: num.number(from: value1)!)
            secondValue = Double(truncating: num.number(from: value2)!)
            thirdValue = Double(truncating: num.number(from: value3)!)
            fourthValue = Double(truncating: num.number(from: value4)!)
            fourthValue = Double(truncating: num.number(from: value5)!)
            
            if firstValue != nil && secondValue != nil && thirdValue != nil && fourthValue != nil {
                
                let outputValue1 = Double((firstValue! - (firstValue! * thirdValue!) / 100) * secondValue! + fifthValue! - fourthValue!)
                
                let outputValue2 =  Double((firstValue! + (firstValue! * thirdValue!) / 100) * secondValue! + fifthValue! - fourthValue!)
                
                minSurPressure.text = String (format: "Minimum Surface Pressure %.0f psi", outputValue1)
                maxFurPressure.text = String (format: "Maximum Surface Pressure %.0f psi", outputValue2)
                
            }
        }
    
    }
    
    @IBAction func gestureTapped(_ sender: Any) {
        view.endEditing(true)
    }
}
