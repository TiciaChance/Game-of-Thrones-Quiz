//
//  PointsVC.swift
//  Watch the Throne
//
//  Created by Laticia Chance on 12/3/16.
//  Copyright © 2016 Laticia Chance. All rights reserved.
//

import UIKit

class PointsVC: UIViewController {

    @IBOutlet weak var usersScoreLabel: UILabel!
    
    var score = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersScoreLabel.text = score
    }

   
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    
    }

}
