//
//  ViewController.swift
//  Calculator
//
//  Created by Bonnie Du on 4/17/15.
//  Copyright (c) 2015 Bonnie Du. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfType = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (userIsInTheMiddleOfType){
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsInTheMiddleOfType = true
        }
    }
    
    

}

