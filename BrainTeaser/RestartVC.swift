//
//  RestartVC.swift
//  BrainTeaser
//
//  Created by Altynbek Orumbaev on 23.03.16.
//  Copyright © 2016 Altynbek Orumbaev. All rights reserved.
//

import UIKit

class RestartVC: UIViewController {
    
    @IBAction func restartBtnPressed(sender: AnyObject) {
    }
    
    @IBOutlet weak var totalScoreLbl: UILabel!
    
    @IBOutlet weak var correctScoreLbl: UILabel!
    
    @IBOutlet weak var wrongScoreLbl: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setResults()
    }
    
    func setResults() {
        correctScoreLbl.text = String(correctCount)
        wrongScoreLbl.text = String(wrongCount)
        totalScoreLbl.text = String(correctCount + wrongCount)
    }
    
    
    
    
}
