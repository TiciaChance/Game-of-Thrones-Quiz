//
//  PointsVC.swift
//  Watch the Throne
//
//  Created by Laticia Chance on 12/3/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class PointsVC: UIViewController {

    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var usersScoreLabel: UILabel!
    
    var score = String()
    var points = Int()
    var game = ViewController()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        usersScoreLabel.text = score
        changeImageView()
    }

   
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    
    }
    
    func changeImageView() {
        if Double(points) <= round(Double(game.questions.count / 2))  {
            imageView.image = #imageLiteral(resourceName: "JS.jpg")
        } else if Double(points) > round(Double(game.questions.count / 2)) && Double(points) < round(Double(game.questions.count)) {
            imageView.image = #imageLiteral(resourceName: "halloffaces.jpg")
        }else if points == (game.questions.count) {
            usersScoreLabel.text = "You answered eveything correctly! The thrones is yours."
            imageView.image = #imageLiteral(resourceName: "throne.jpg")
            tryAgainButton.setTitle("Play Again", for: .normal)
            
        }
    }

}
