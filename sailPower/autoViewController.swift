//
//  autoViewController.swift
//  sailPower
//
//  Created by MARYANNE WEISS on 12/23/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import UIKit

class autoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func Settings(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
        
       let nextViewController = storyBoard.instantiateViewController(withIdentifier:"settingsViewController")
        
       self.present(nextViewController, animated:true, completion:nil)
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
