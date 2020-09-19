//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mithun Raj on 16/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amountToBeShared = ""
    var splitPersonsCount = ""
    var tipPercentage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tipPercentage", tipPercentage)
        let tipPercentageWithoutDecimals = tipPercentage.dropLast(2)
        totalLabel.text = amountToBeShared
        settingsLabel.text = "Split between \(splitPersonsCount) people, with \(tipPercentageWithoutDecimals)% tip."
    }
    
    //MARK: - Recalculate button pressed action
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true) {
            
        }
    }
}
