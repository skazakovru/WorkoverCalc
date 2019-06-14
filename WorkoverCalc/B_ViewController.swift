//
//  B_ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/27/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class B_ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var pressureGuageTVD: UITextField!
    
    @IBOutlet weak var recordedPressure: UITextField!
    
    @IBOutlet weak var topPeforationsDepth: UITextField!
    
    @IBOutlet weak var fluidDensity: UITextField!
    
    @IBOutlet weak var feetToMetersLabel: UILabel!
    
    @IBOutlet weak var switchForMetersTapped: UISwitch!
    
    @IBOutlet weak var outputTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainButton.applyDesign()
    }

    @IBAction func calculateButtonPressed(_ sender: Any) {
    
    if pressureGuageTVD.text == "" || recordedPressure.text == "" || topPeforationsDepth.text == "" || fluidDensity.text == "" {
    outputTextField.text = String("Check your entries!")
    } else {
    
    let num = NumberFormatter()
    num.roundingMode = .up
    num.minimumFractionDigits = 1
    num.maximumFractionDigits = 1
    var value1 = pressureGuageTVD.text!
    if num.number(from:value1) == nil {
    value1 = value1.replacingOccurrences(of: ".", with: ",")
    }
    var value2 = recordedPressure.text!
    if num.number(from:value2) == nil {
    value2 = value2.replacingOccurrences(of: ".", with: ",")
    }
    var value3 = topPeforationsDepth.text!
    if num.number(from:value3) == nil {
    value3 = value3.replacingOccurrences(of: ".", with: ",")
    }
    var value4 = fluidDensity.text!
    if num.number(from:value4) == nil {
    value4 = value4.replacingOccurrences(of: ".", with: ",")
        }
        
    let firstValue = Double(truncating: num.number(from: value1)!)
    let secondValue = Double(truncating: num.number(from: value2)!)
    let thirdValue = Double(truncating: num.number(from: value3)!)
    let fourthValue = Double(truncating: num.number(from: value4)!)
    
    if switchForMetersTapped.isOn {
     feetToMetersLabel.text = String("ft")
        
        let outputValue = 19.23 * (secondValue + (0.052 * fourthValue * (thirdValue - firstValue))) / thirdValue
    
       outputTextField.text = (num.string(from: NSNumber(value: outputValue)) ?? "") + "ppg"
        
    
    } else {
         feetToMetersLabel.text = String("m")
        
    let outputValue = 19.23 * (secondValue + (0.052 * fourthValue * (thirdValue - firstValue) * 3.281)) / (3.281 * thirdValue)
        
   
    outputTextField.text = (num.string(from: NSNumber(value: outputValue)) ?? "") + "ppg"
    
    }
    }
}
}

extension UIButton {
    func applyDesign() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}



