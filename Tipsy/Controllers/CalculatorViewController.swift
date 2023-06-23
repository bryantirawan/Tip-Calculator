//
//  ViewController.swift
//  Tipsy
//
//  Created by Bryant Irawan on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var billTotal: Float? = 0.00
    var tipSelected: Float? = 0.0
    var peopleToSplit: Int? = 1
    var splitAmount: Float? = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        if zeroPctButton.isSelected == true {
            tipSelected = 0.0
        } else if tenPctButton.isSelected == true {
            tipSelected = 0.1
        } else {
            tipSelected = 0.2
        }
        
        billTextField.endEditing(true)
        
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        peopleToSplit = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Float(billTextField.text!)
        
        print("tipSelected is \(tipSelected!)")
        print(billTextField.text ?? "no bill total")
        print("billTotal is \(billTotal!)")
        
        splitAmount = (billTotal! * (1 + tipSelected!)) / Float(peopleToSplit!)
        print("split amount is \(splitAmount!)")
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitAmount = splitAmount
            destinationVC.tipSelected = tipSelected
            destinationVC.peopleToSplit = peopleToSplit

        }
    }
    
    
}

