//
//  ResultsViewController.swift
//  RockModQuiz
//
//  Created by Ruslan Safin on 06/05/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit
import AVFoundation

class ResultsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var resultType: UILabel!
    @IBOutlet var resultDefinition: UILabel!
    @IBOutlet var againButton: UIButton!
    
    // MARK: - Vars
    var rockIndex = 0
    var midIndex = 0
    var fogeyIndex = 0
    
    var answers: [Answer]!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        againButton.layer.cornerRadius = 10
        presentResult()
    }
    
    // MARK: - Methods
    func presentResult() {
        answers.enumerated().forEach {
            switch $0.element.type {
            case .rocker:
                rockIndex += 1
            case .mid:
                midIndex += 1
            case .fogey:
                fogeyIndex += 1
            }
        }
        
        let result = max(rockIndex, midIndex, fogeyIndex)
        switch result {
        case rockIndex:
            resultType.text = "You are a Rock!"
            resultType.font = UIFont(name:"NewRocker-Regular", size: 35)
            resultDefinition.text = HumanType.rocker.definition
            resultDefinition.font = UIFont(name:"NewRocker-Regular", size: 25)
            speak(text: resultType.text!)
        case midIndex:
            resultType.text = "You are a Mid!"
            resultDefinition.text = HumanType.mid.definition
            speak(text: resultType.text!)
        case fogeyIndex:
            resultType.text = "You are a Fogey!"
            resultType.font = UIFont(name:"Beautiful People Personal Use", size: 40)
            resultDefinition.text = HumanType.fogey.definition
            resultDefinition.font = UIFont(name:"Beautiful People Personal Use", size: 25)
            speak(text: resultType.text!)
        default:
            break
        }
    }
    
    func speak (text: String) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.pitchMultiplier = 1
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.volume = 0.7
        utterance.voice = AVSpeechSynthesisVoice.init()
        speechSynthesizer.speak(utterance)
    }
}
