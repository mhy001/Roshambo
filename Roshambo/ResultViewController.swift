//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Mark Yang on 6/11/16.
//  Copyright © 2016 Myang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var playerAction: GameActions?
    var gameResult: Int?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        if let result = gameResult, action = playerAction {
            if result == 1 {
                resultLabel.text = "YOU WIN"
                switch action {
                case .Rock:
                    resultImage.image = UIImage(named: "RockCrushesScissors")
                case .Paper:
                    resultImage.image = UIImage(named: "PaperCoversRock")
                case .Scissor:
                    resultImage.image = UIImage(named: "ScissorsCutPaper")
                }
            } else if result == -1 {
                resultLabel.text = "YOU LOSE"
                switch action {
                case .Rock:
                    resultImage.image = UIImage(named: "PaperCoversRock")
                case .Paper:
                    resultImage.image = UIImage(named: "ScissorsCutPaper")
                case .Scissor:
                    resultImage.image = UIImage(named: "RockCrushesScissors")
                }
            } else {
                resultLabel.text = "TIE"
                resultImage.image = UIImage(named: "Tie")
            }
        }
    }
    
    
}

