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
        names = ["Tubing/casing Communication TVD", "KWM from BHPG/SGS survey", "KWM from SITP w/known fluid density", "Bullheading", "Burst Pressure for Worn out Casing", "Casing or Tubing Pressure Test", "Mud Compression when Testing", "Surface pressure to shear pinned plug", "Minimum DC weight in BHA", "Tenth"]
        segueIdentities = ["A","B","C","D","E","F","G","H","I","J"]
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

