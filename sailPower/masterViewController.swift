//
//  masterViewController.swift
//  sailPower
//
//  Created by MARYANNE WEISS on 12/23/18.
//  Copyright © 2018 WSE. All rights reserved.
//

import UIKit

class masterViewController: UIViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView(value: 0)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
         updateView(value: sender.selectedSegmentIndex)
    
    }
    
    lazy var manualViewController: manualViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var  viewController = storyboard.instantiateViewController(withIdentifier: "manualViewController") as! manualViewController
        
        addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var autoViewController: autoViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var  viewController = storyboard.instantiateViewController(withIdentifier: "autoViewController") as! autoViewController
        addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
        
    }()
    
    
    
    //Mark: - View Methods
    
    
    
    
    private func updateView(value:Int){
    
        autoViewController.view.isHidden = !(value == 0)
        manualViewController.view.isHidden = (value == 0)
    }


    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChild(childViewController)
        
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childViewController.didMove(toParent: self)
        
        
        
    }

}
