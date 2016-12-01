//
//  ViewController.swift
//  Watch the Throne
//
//  Created by Laticia Chance on 11/30/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    //practice dummy data
    let questions = ["Where are you traveling to in 2017?", "Favorite snack?", "Fav movie?", "fav british series"]
    let answers = [["New York", "Cuba", "Japan", "Sweden"], ["Chips?", "Popcorn?", " Peanuts", "Bell Peppers"], ["Do the right thing", "all about eve", "love actually", "the pianist"], ["luther", "chewing gum", "misfits", "footballer's wives"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func answerButtonTapped(_ sender: AnyObject) {
        
        if sender.tag == Int(rightAnswerPlacement) {
            questionLabel.text = "Correct!"
            point += 1
        } else {
            questionLabel.text = "Try Again"
        }
        
        if currentQuestion != questions.count{
            newQuestion()
        }
        
    }
    
    func endGame() {
        
        if currentQuestion == questions.count {
            //text label on next vc == points/questions.count 
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    func newQuestion() {
        
        questionLabel.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3) + 1
        
        var button = UIButton()
        var x = 1
        
        for i in 1...4 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
            
        }
        
        if x == 2 {
            button.setTitle(answers[currentQuestion][3], for: .normal)
        }
        
        currentQuestion += 1
        
    }
    
    
}

