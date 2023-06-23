//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bryant Irawan on 12/22/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var splitAmount: Float? = 0.00
    var tipSelected: Float? = 0.0
    var peopleToSplit: Int? = 1
    
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //totalLabel.text = String(splitAmount!)
        totalLabel.text = String(format: "%.2f", splitAmount!)
        settingsLabel.text = "Split between \(peopleToSplit!) people with \(Int(tipSelected! * 100)) %"
    }
    
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
