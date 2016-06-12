//
//  ViewController.swift
//  Roshambo
//
//  Created by Mark Yang on 6/11/16.
//  Copyright © 2016 Myang. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {

    func randomComputerSelection() -> GameActions {
        let randomValue = arc4random() % 3
        
        return GameActions(rawValue: Int(randomValue))!
    }
    
    func judgeGame(playerAction playerAction: GameActions, computerAction: GameActions) -> Int {
        switch playerAction {
        case .Rock:
            switch computerAction {
            case .Rock:
                print("Tie! Rock vs Rock")
                return 0
            case .Paper:
                print("You lose! Rock vs Paper")
                return -1
            case .Scissor:
                print("You win! Rock vs Scisscor")
                return 1
            }
        case .Paper:
            switch computerAction {
            case .Rock:
                print("You win! Paper vs Rock")
                return 1
            case .Paper:
                print("Tie! Paper vs Paper")
                return 0
            case .Scissor:
                print("You lose! Paper vs Scisscor")
                return -1
            }
        case .Scissor:
            switch computerAction {
            case .Rock:
                print("You lose! Scissor vs Rock")
                return -1
            case .Paper:
                print("You win! Scissor vs Paper")
                return 1
            case .Scissor:
                print("Tie! Scissor vs Scisscor")
                return 0
            }
        }
    }
    
    // Rock: Present ResultViewController via code only
    @IBAction func playRock() {
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.playerAction = GameActions.Rock
        controller.gameResult = judgeGame(playerAction: controller.playerAction!, computerAction: randomComputerSelection())
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    // Paper: Present ResultViewController via code & segue
    @IBAction func playPaper() {
        performSegueWithIdentifier("playPaper", sender: self)
    }
    
    // Scissor: Present ResultViewController via segue only
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        
        if segue.identifier == "playPaper" {
            controller.playerAction = GameActions.Paper
        }else if segue.identifier == "playScissor" {
            controller.playerAction = GameActions.Scissor
        }
        controller.gameResult = judgeGame(playerAction: controller.playerAction!, computerAction: randomComputerSelection())
    }


}

