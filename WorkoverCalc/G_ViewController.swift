//
//  G_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class G_ViewController: UIViewController {

  
    @IBOutlet weak var mainButton: UIButton!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mudVolumeTextField: UITextField!
    @IBOutlet weak var pressureAppliedTextField: UITextField!
    
    @IBOutlet weak var outputValue: UILabel!
   
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainButton.applyDesign()
    }
    

    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            resultLabel.text? = "0.0000045"
        case 1:
            resultLabel.text? = "0.0000030"
            
        default:
            break
        }
    }

    @IBAction func calculateTapped(_ sender: Any) {
        
        if mudVolumeTextField.text == "" || pressureAppliedTextField.text == "" {
            outputValue.text = String("Check input values")
        } else {
            
            let num = NumberFormatter()
            var value1 = mudVolumeTextField.text!
            if num.number(from:value1) == nil {
                value1 = value1.replacingOccurrences(of: ".", with: ",")
            }
            
            var value2 = pressureAppliedTextField.text!
            if num.number(from:value2) == nil {
                value2 = value2.replacingOccurrences(of: ".", with: ",")
            }
            var value3 = resultLabel.text!
            if num.number(from:value3) == nil {
                value3 = value3.replacingOccurrences(of: ".", with: ",")
            }
            
            let firstValue = Double(truncating: num.number(from: value1)!)
            let secondValue = Double(truncating: num.number(from: value2)!)
            let thirdValue = Double(truncating: num.number(from: value3)!)
            
            let outPut = Double(firstValue * secondValue * thirdValue)
            
            outputValue.text = String (format: "%.1f bbl", outPut)
        }
    }
}

