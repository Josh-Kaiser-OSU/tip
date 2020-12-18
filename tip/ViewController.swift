//
//  ViewController.swift
//  tip
//
//  Created by Joshua Kaiser on 12/11/20.
//

import UIKit

// There is always one ViewController file for every screen you have in your iOS app
// The average app will have 6 screens
class ViewController: UIViewController {
    // These outlets are for every element of your screen that you want to configure
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.title = "Tip Calculator"
    }
    
    // All apps will have various actions
    @IBAction func onTap(_ sender: Any) {
        // Undo
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.2]
        
        // Calculate the tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Get the peopleStepperValue
        // Set the peopleLabel
        let peopleNumber = peopleStepper.value
        let people = String(format: "%.0f", peopleNumber)
        peopleLabel.text = people
        
        // Caluculate the per person cost
        let perPersonCost = total / peopleNumber
        
        // display the per person value
        perPersonLabel.text = String(format: "$%.2f", perPersonCost)
        
    }
    
    
}

