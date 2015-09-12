//
//  ViewController.swift
//  TIP
//
//  Created by James Dillard on 9/11/15.
//  Copyright (c) 2015 James Dillard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
   
    @IBOutlet weak var tipMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.20, 200]
        var tipNotes = ["CheapO", "Good deal partner",
            "Stacks on deck, Patron on ice"]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tipNote = tipNotes[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        tipMessage.text = tipNote
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

