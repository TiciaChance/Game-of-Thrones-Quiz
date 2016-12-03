//
//  ViewController.swift
//  Watch the Throne
//
//  Created by Laticia Chance on 11/30/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    //practice dummy data
    let questions = ["Which household possesses the banner of a moon and a falcon??",
                     "The phrase \"Hold the door\" is associated with which character?",
                     "What was the name of Catelyn Stark's father?",
                     "What was the name of Arya's direwolf?",
                     "Who was the first to stab Jon Snow in the Season 5 finale?",
                     "This (possibly) royal character hasn't been seen since Season 3?",
                     "Who said, \"A very small man can cast a very large shadow\"?"
                     ]
    let answers = [["House Arryn", "House Greyjoy", "House Lannister", "House Karstark"],
                   ["Hodor", "Jon Snow", "Cersei", "Lord Baelish"],
                   ["Lord Hoster", "Lord Arryn", "Lord Tywin", "Lord Edmure"],
                   ["Nymeria", "Summer", "Snow", "Lady"],
                   ["Alliser Thorne", "Olly", "Tormund", "Bowen Marsh"],
                   ["Gendry", "Joffry", "Margaery", "Jon Snow"],
                   ["Lord Varys","Tyrion","Jamie Lannister","Ned Stark"]
                   ]
    
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    //var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newQuestion()
        resultLabel.isHidden = true
        
    }
    
    @IBAction func answerButtonTapped(_ sender: AnyObject) {
        
        if sender.tag != Int(rightAnswerPlacement) {
            resultLabel.isHidden = false
            resultLabel.text = "You know nothing, Jon Snow. Try again!"
        }
        
        if currentQuestion != questions.count && sender.tag == Int(rightAnswerPlacement){
            newQuestion()
        }
        
        if currentQuestion == questions.count && sender.tag == Int(rightAnswerPlacement) {
           // performSegue(withIdentifier: "showImageVC", sender: self)
            questionLabel.text = "Winter is here"
//            resultLabel.isHidden = false
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
