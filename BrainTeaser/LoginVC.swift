//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Altynbek Orumbaev on 22.03.16.
//  Copyright © 2016 Altynbek Orumbaev. All rights reserved.
//

import UIKit
import pop


class LoginVC: UIViewController {

    
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    
    
    var animEngine: AnimationEngine!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animEngine  = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginConstraint])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(animated: Bool) {
        
        self.animEngine.animateOnScreen(0)
        
        }
        
     

}

