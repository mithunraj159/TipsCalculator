//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var splitNumber = 2.0
    var amountToBeShared = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Tip button pressed action
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
                
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!

        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())

        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!

        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
    }
        
    //MARK: - Stepper Value Changed action
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Double(sender.value)
        DispatchQueue.main.async {
            self.splitNumberLabel.text = String(Int(self.splitNumber))
        }
    }
    
    //MARK: - Calculate button pressed action
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        if let amount = billTextField.text, let amountInDouble = Double(amount) {
            amountToBeShared = calculateLogic(amountToBeSplit: amountInDouble, splitNumbers: splitNumber, tip: tip)
            self.performSegue(withIdentifier: "resultSegue", sender: nil)
        } else {
            print("No value in textfield")
        }
    }
    
    //MARK: - Logic calculating the amount to be split
    func calculateLogic(amountToBeSplit: Double, splitNumbers: Double, tip: Double) -> String {
        let tipAmount = amountToBeSplit * tip
        let totalAmountIncludingTip = amountToBeSplit + tipAmount
        let finalAmountToBeSplit = totalAmountIncludingTip / splitNumbers
        return String(finalAmountToBeSplit)
        //print("finalAmountToBeSplit", finalAmountToBeSplit)
    }
    
    //MARK: - PrepareSegue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "resultSegue") {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.amountToBeShared = amountToBeShared
            resultVC.splitPersonsCount = splitNumberLabel.text ?? ""
            resultVC.tipPercentage = String(tip * 100)
        }
    }
    
}

