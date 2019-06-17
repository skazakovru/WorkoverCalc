//
//  ViewController.swift
//  WorkoverCalc
//
//  Created by Sergei Kazakov on 5/25/19.
//  Copyright © 2019 Sergei Kazakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var names = [String]()
    var segueIdentities = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        names = ["Tubing/Casing Communication TVD", "KWM from BHPG/SGS Survey", "KWM from SITP w/Known Fluid Density", "Bullheading (Maximum Initial and Final Pressures)", "Burst Pressure for Worn Out Casing", "Casing or Tubing Pressure Test", "Mud Compression when Testing", "Surface Pressure to Shear Pinned Plug", "Minimum DC weight in BHA", "Spacer Volume Behind Balanced Plug", "* Abbreviations", "** DISCLAMER"]
        segueIdentities = ["A","B","C","D","E","F","G","H","I","J","K","L"]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = segueIdentities[indexPath.row]
        let viewController = (storyboard?.instantiateViewController(withIdentifier: vcName))
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}

