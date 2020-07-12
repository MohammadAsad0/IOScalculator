//
//  ViewController.swift
//  Calculator
//
//  Created by Mohd Asad on 7/5/20.
//  Copyright © 2020 Mohd Asad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numbers=""
    var isNumberNegative=false;
    var firstNum=0.0
    var clear = -1
    var action = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNumbers(_ sender: UIButton) {
        
        if clear == 0 {
            numbers=""
            clear = -1
        }
        
        switch sender.tag {
        case 0:
            numbers+="0"
        case 1:
            numbers+="1"
        case 2:
            numbers+="2"
        case 3:
            numbers+="3"
        case 4:
            numbers+="4"
        case 5:
            numbers+="5"
        case 6:
            numbers+="6"
        case 7:
            numbers+="7"
        case 8:
            numbers+="8"
        case 9:
            numbers+="9"
        case 10:
            numbers+="."
        
        default:
            numbers="0"
        }
        if isNumberNegative {
            label.text="-"+numbers
        } else {
            label.text=numbers
        }
    }
    
    @IBAction func performAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            numbers="0"
            isNumberNegative=false
            action = -1
            clear = 0
        case 1:
            if !isNumberNegative {
                isNumberNegative=true;
            } else {
                isNumberNegative=false;
            }
            break
        case 2:
            var percent=Double(numbers) ?? 0
            percent*=0.01
            numbers=String(percent)
            break
        case 3:
            firstNum=Double(numbers) ?? 0.0
            action=0
            clear = 0
            break
        case 4:
            firstNum=Double(numbers) ?? 0.0
            action=1
            clear = 0
            break
        case 5:
            if action == -1{
                firstNum=Double(numbers) ?? 0.0
                action=2
            } else {
                let secondNum=Double(numbers) ?? 0.0
                var result:Double
                switch action {
                case 0:
                    result=(firstNum/secondNum)
                case 1:
                    result=firstNum*secondNum
                case 2:
                    result=firstNum+secondNum
                case 3:
                    result=firstNum-secondNum
                default:
                    result=0
                }
                if(result<0) {
                    isNumberNegative=true
                }else{
                    isNumberNegative=false
                }
                numbers=String(result)
                action=2
                firstNum=result
            }
            clear = 0
            break
        case 6:
            firstNum=Double(numbers) ?? 0.0
            action=3
            clear = 0
            break
        case 7:
            let secondNum=Double(numbers) ?? 0.0
            var result:Double
            switch action {
            case 0:
                result=(firstNum/secondNum)
            case 1:
                result=firstNum*secondNum
            case 2:
                result=firstNum+secondNum
            case 3:
                result=firstNum-secondNum
            default:
                result=0
            }
            if(result<0) {
                isNumberNegative=true
            }else{
                isNumberNegative=false
            }
            numbers=String(result)
            action = -1
            clear=0
            break
        default:
            break
        }
        if isNumberNegative {
            label.text="-"+numbers
        } else {
            label.text=numbers
        }
    }
    
}

