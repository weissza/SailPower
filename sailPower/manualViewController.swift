//
//  manualViewController.swift
//  sailPower
//
//  Created by MARYANNE WEISS on 12/23/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import UIKit


class manualViewController: UIViewController {

    @IBOutlet weak var maxSpeed: UILabel!
    @IBOutlet weak var windSpeed: UITextField!
    @IBOutlet weak var windAngle: UITextField!
    @IBOutlet weak var boatSpeed: UITextField!
    @IBOutlet weak var efficiency: UILabel!
    let m:mathStuff = mathStuff.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculate(_ sender: Any) {
        if(checkString(box: windSpeed) && checkString(box: windAngle)){
            Calc()
        }
    }
    
    private func checkString(box:UITextField) -> Bool{
        if(box.text == "" || atof(box.text) <= 0.0 || box.text == "NaN"){
            box.text = ""
            return false
        }
        return true
    }
    
    private func Calc() {
        let max:Double = m.calcMaxSpeed( currSpeed: atof(windSpeed.text),currAngle: atof(windAngle.text))
        var currSpeed:Double = max;
        maxSpeed.text = String(format: "%.2f", max)
        
        if(checkString(box: boatSpeed)){
            currSpeed = atof(boatSpeed.text)
        }
        
        efficiency.text = String.init(Int.init(currSpeed / max * 100 )) + "%"
    }
    
    

}
