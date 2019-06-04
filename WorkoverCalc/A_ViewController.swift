//
//  A_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/26/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class A_ViewController: UIViewController {


    @IBOutlet weak var SITP: UITextField!
    @IBOutlet weak var SICP: UITextField!    
    @IBOutlet weak var tubingFluidDensity: UITextField!
    @IBOutlet weak var casingFluidDensity: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultInMetersLabel: UILabel!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

  
    }
    
    
    @IBAction func calculateButton(_ sender: Any) {
        if SITP.text == "" || SICP.text == "" || tubingFluidDensity.text == "" || casingFluidDensity.text == "" {
            resultLabel.text = String("Fill out all cells with valid numbers.")
        } else {
            var firstValue = Double(SITP.text!)
            var secondValue = Double(SICP.text!)
            var thirdValue = Double(tubingFluidDensity.text!)
            var fourthValue = Double(casingFluidDensity.text!)
            
            let num = NumberFormatter()
            
            var value1 = SITP.text!
            var value2 = SICP.text!
            var value3 = tubingFluidDensity.text!
            var value4 = casingFluidDensity.text!
            
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
            
            if firstValue != nil && secondValue != nil && thirdValue != nil && fourthValue != nil {
                
                let outputValue1 = Double((firstValue! - secondValue!)/(0.052 * (fourthValue! - thirdValue!)))
                
                let outputValue2 = Double((outputValue1) / 3.281)
                
                resultLabel.text = String (format: "Estimated communication TVD at %.0f ft", outputValue1)
                resultInMetersLabel.text = String (format: "Estimated communication TVD at %.0f m", outputValue2)
                
            }
        }
    }
    @IBAction func screenTapped(_ sender: Any) {view.endEditing(true)
    }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

