//
//  WelcomeViewController.swift
//  RockModQuiz
//
//  Created by Ruslan Safin on 06/05/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
    }
}
