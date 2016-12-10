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
    
    let questions = ["Which household possesses the banner of a moon and a falcon??",
                     "The phrase \"Hold the door\" is associated with which character?",
                     "What was the name of Catelyn Stark's father?",
                     "What was the name of Arya's direwolf?",
                     "Who was the first to stab Jon Snow in the Season 5 finale?",
                     "This (possibly) royal character hasn't been seen since Season 3?",
                     "Who said, \"A very small man can cast a very large shadow\"?",
                     "What does \"valar dohaeris\" mean?",
                     "Name the \"other\" Stark child: Robb, Brandon, Sansa, Arya. Jon Snow and…?"
                     ]
    let answers = [["House Arryn", "House Greyjoy", "House Lannister", "House Karstark"],
                   ["Hodor", "Jon Snow", "Cersei", "Lord Baelish"],
                   ["Lord Hoster", "Lord Arryn", "Lord Tywin", "Lord Edmure"],
                   ["Nymeria", "Summer", "Snow", "Lady"],
                   ["Alliser Thorne", "Olly", "Tormund", "Bowen Marsh"],
                   ["Gendry", "Joffrey", "Margaery", "Jon Snow"],
                   ["Lord Varys","Tyrion","Jamie Lannister","Ned Stark"],
                   ["All men must serve", "All men must die", "All men must grow", "All men will learn"],
                   ["Rickon", "Dickon", "Ramsay", "Tyrell"]
                   ]
    
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    var points = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        points = 0
        currentQuestion = 0
        newQuestion()
    }
    
    @IBAction func answerButtonTapped(_ sender: AnyObject) {
        
        if sender.tag == Int(rightAnswerPlacement) && currentQuestion != questions.count{
            points += 1
            print(points)
            
            newQuestion()
        } else if sender.tag != Int(rightAnswerPlacement) && currentQuestion != questions.count{
            newQuestion()
        } else if sender.tag != Int(rightAnswerPlacement) && currentQuestion == questions.count {
             performSegue(withIdentifier: "showImageVC", sender: self)
        } else if sender.tag == Int(rightAnswerPlacement) && currentQuestion == questions.count {
            points += 1
            performSegue(withIdentifier: "showImageVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageVC" {
            let VC = segue.destination as! PointsVC
            VC.score = "Your score: \(points)/\(questions.count)"
            VC.points = points
        }
    }
    
}

extension ViewController {
    
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
