//
//  E_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class E_ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var yieldStrength: UITextField!
    @IBOutlet weak var wallThickness: UITextField!    
    @IBOutlet weak var outsideDiameter: UITextField!
    
    @IBOutlet weak var ouputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainButton.applyDesign()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        if yieldStrength.text == "" || wallThickness.text == "" || outsideDiameter.text == "" {
            ouputLabel.text = String("Fill out all cells with valid numbers.")
        } else {
            var firstValue = Double(yieldStrength.text!)
            var secondValue = Double(wallThickness.text!)
            var thirdValue = Double(outsideDiameter.text!)
            
            let num = NumberFormatter()
            
            var value1 = yieldStrength.text!
            var value2 = wallThickness.text!
            var value3 = outsideDiameter.text!
            
            if num.number(from:value1) == nil {
                value1 = value1.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value2) == nil {
                value2 = value2.replacingOccurrences(of: ".", with: ",")
            }
            if num.number(from: value3) == nil {
                value3 = value3.replacingOccurrences(of: ".", with: ",")
            }

            firstValue = Double(truncating: num.number(from: value1)!)
            secondValue = Double(truncating: num.number(from: value2)!)
            thirdValue = Double(truncating: num.number(from: value3)!)
            
            
            let outputValue = 2 * firstValue! * secondValue! / thirdValue!
            
           ouputLabel.text = String (format: "Internal pressure rating (burst): %.0fpsi", outputValue)
    }
    
}
}

