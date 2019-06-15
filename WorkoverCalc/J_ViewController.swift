//
//  J_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class J_ViewController: UIViewController {

    @IBOutlet weak var spacerAhead: UITextField!
    @IBOutlet weak var workstringID: UITextField!
    @IBOutlet weak var workstringOD: UITextField!
    @IBOutlet weak var openHoleDia: UITextField!
    @IBOutlet weak var excessApplied: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        if spacerAhead.text == "" || workstringID.text == "" || workstringOD.text == "" || openHoleDia.text == "" || excessApplied.text == "" {
            outputLabel.text = String("Fill out all cells first.")
        } else {
            var firstValue = Double(spacerAhead.text!)
            var secondValue = Double(workstringID.text!)
            var thirdValue = Double(workstringOD.text!)
            var fourthValue = Double(openHoleDia.text!)
            var fifthValue = Double(excessApplied.text!)
            
            let num = NumberFormatter()
            
            var value1 = spacerAhead.text!
            var value2 = workstringID.text!
            var value3 = workstringOD.text!
            var value4 = openHoleDia.text!
            var value5 = excessApplied.text!
            
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
            fifthValue = Double(truncating: num.number(from: value5)!)
            
            
            let outputValue = 0.0009714 * firstValue! * secondValue! * secondValue! / ((fourthValue! * fourthValue! - thirdValue! * thirdValue!) * 0.0009714 / (fifthValue! / 100 + 1))
            
            
            outputLabel.text = String (format: "Spacer behind to balance: %.1f bbls", outputValue)
        }
    }
    }

