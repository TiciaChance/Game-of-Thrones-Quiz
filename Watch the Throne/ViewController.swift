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
    
    @IBOutlet weak var resultLabel: UILabel!
    //practice dummy data
    let questions = ["Where are you traveling to in 2017?", "Favorite snack?", "Fav movie?", "fav british series"]
    let answers = [["New York", "Cuba", "Japan", "Sweden"], ["Chips?", "Popcorn?", " Peanuts", "Bell Peppers"], ["Do the right thing", "all about eve", "love actually", "the pianist"], ["luther", "chewing gum", "misfits", "footballer's wives"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newQuestion()
        resultLabel.isHidden = true
        
    }
    
    @IBAction func answerButtonTapped(_ sender: AnyObject) {
        
        if sender.tag == Int(rightAnswerPlacement) {
            questionLabel.text = "Correct!"
            point += 1
        } else {
            resultLabel.isHidden = false
            resultLabel.text = "You "
        }
        
        if currentQuestion != questions.count && sender.tag == Int(rightAnswerPlacement){
            newQuestion()
        }
        
        if currentQuestion == questions.count && sender.tag == Int(rightAnswerPlacement) {
            performSegue(withIdentifier: "showImageVC", sender: self)
            
        }
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
        resultLabel.isHidden = true
        
    }
    
}


