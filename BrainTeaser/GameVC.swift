//
//  GameVC.swift
//  BrainTeaser
//
//  Created by Altynbek Orumbaev on 23.03.16.
//  Copyright © 2016 Altynbek Orumbaev. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {
    
    
    @IBOutlet weak var yesBtn: CustomButton!
    @IBOutlet weak var noBtn: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    var correctCounter = 0
    var wrongCounter = 0
    var currentCard: Card!
    var prevCard: Card!
    var timer: NSTimer! // timer for 1:00
    var timerCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        
        currentCard.center = AnimationEngine.screenCenterPosition
        
        prevCard = currentCard
        
        self.view.addSubview(currentCard)
    }
    
    
    @IBAction func yesPressed(sender: UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        }
        else {
            titleLbl.text = "Does this card match the previous?"
            startTimer()
            timerCounter = 60
        }
        showNextCard()
    }
    
    @IBAction func noPressed(sender: AnyObject) {
        checkAnswer()
        showNextCard()
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(GameVC.changeTimerLabel), userInfo: nil, repeats: true)
        
    }
    
    func changeTimerLabel() {
        if timerCounter > 0 {
            
            timerCounter -= 1
            timerLbl.text = getTime(timerCounter)
        }
        else {
            timer.invalidate()
            performSegueWithIdentifier("GoToScoreMenu", sender: self)
        }
    }
    
    func getTime(time : Int) -> String {
        
        let minute = time / 60
        let second = time
        
        return "\(minute):\(second)"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "GoToScoreMenu"{
            
            if let seg = segue.destinationViewController as? RestartVC {
                seg.correctCount = self.correctCounter
                seg.wrongCount = self.wrongCounter
            }
        }
    }
    
    func showNextCard() {
        
        if let current = currentCard {
            let cardToRemove = current
            prevCard = cardToRemove
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPoisition, completion: { (anim: POPAnimation!, finished: Bool) -> Void in
                cardToRemove.removeFromSuperview()
            })
            
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.hidden {
                noBtn.hidden = false
                yesBtn.setTitle("YES", forState: .Normal)
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim: POPAnimation!, finished: Bool) -> Void in
                
            })
        }
    }
    
    func createCardFromNib() -> Card? {
        return  NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }
    
    func checkAnswer() {
        
        if currentCard.currentShape == prevCard.currentShape {
            correctCounter += 1
        }
        else {
            wrongCounter += 1
        }
        
    }
    
    
    
}
