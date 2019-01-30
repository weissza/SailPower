//
//  settingsViewController.swift
//  sailPower
//
//  Created by MARYANNE WEISS on 12/24/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {

    //MARK - settings
    let settings = UserDefaults.standard

    //MARK - entry fields
    
    @IBOutlet weak var IP: UITextField!
    @IBOutlet weak var port: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSettings()
    }
    
    
    @IBAction func back(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier:"master")
        
        self.present(nextViewController, animated:true, completion:nil)
        

    }
    
    private func checkSettings(){
        if (settings.integer(forKey: "port") == 0 ){
            settings.set(2000, forKey: "port")
        }
        
        if ((settings.object(forKey: "IP")as? String ?? String()) == ""){
            settings.set("0.0.0.0", forKey: "IP")

        }
        IP.text = settings.object(forKey: "IP")as? String ?? String()
        port.text = String.init(settings.integer(forKey: "port"))
    }
    
    
    
    @IBAction func saveIP(_ sender: Any) {
       let newString = IP.text as? String ?? String()
        settings.set(newString, forKey: "IP")
    }
    
    @IBAction func savePort(_ sender: Any) {
        settings.set(atoi(port.text), forKey: "port")
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
