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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if(userIsInTheMiddleOfType){
            enter()
        }
        switch operation{
        case "✖️": performOperation { $0 * $1 }
        case "➗": performOperation { $1 / $0 }
        case "➕": performOperation { $0 + $1 }
        case "➖": performOperation { $1 - $0 }
        case "√": performOperation1 { sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation1(operation: Double -> Double) {
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
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
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfType = false
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    var displayValue: Double{
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfType = false
        }
        
    }
    

}

