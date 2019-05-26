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
        names = ["Tubing/casing communication TVD", "Second", "Third", "Fourth", "Sixth", "Seventh", "Eighth", "Nineth", "Tenth"]
        segueIdentities = ["A","B","C","D","E","F","G","H","I","J"]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = segueIdentities[indexPath.row]
        let viewController = (storyboard?.instantiateViewController(withIdentifier: vcName))
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}

