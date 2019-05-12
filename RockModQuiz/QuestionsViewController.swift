//
//  QuestionsViewController.swift
//  RockModQuiz
//
//  Created by Ruslan Safin on 06/05/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    // MARK: - Vars
    var questionIndex = 0
    var questions: [Question] = [
        
        Question(
            text: "There's this program you really want to watch, but you decide to flick through the channels, and you find Aerosmith on the music channel. Do you...",
            answers: [
                Answer(text: "instantly leave it on that channel! Aerosmith rock!", type: .rocker),
                Answer(text: "Eh? Who are Aerosmith?", type: .mid),
                Answer(text: "You convince yourself Aerosmith are rubbish", type: .fogey)
            ]
        ),
        
        Question(
            text: "You're on one of those silent trains where you're not meant to talk, and you are listening to your radio. Then, AC/DC come on. Do you...",
            answers: [
                Answer(text: "Turn it up loud for the world to hear! Rock on AC/DC!", type: .rocker),
                Answer(text: "Don't disturb the people, just silently head bang. I'm VERY polite!", type: .fogey),
                Answer(text: "Go back to school, dude! It's ABC, not AC/DC! ", type: .mid)
            ]
        ),
        
        Question(
            text: "You're walking along the road, then you see Robert Plant. Do you...",
            answers: [
                Answer(text: "I said I'm polite! I ask discreetly for his autograph...", type: .mid),
                Answer(text: "He's my hero! Run up and hug him!", type: .rocker),
                Answer(text: "Hmm, the Robert Plant, that might do wonders for my garden...", type: .fogey)
            ]
        ),
        
        Question(
            text: "You've just seen Lauri from the Rasmus, and he's walking up to you, do you...",
            answers: [
                Answer(text: "Look casual. I don't want him to think I'm a jerk", type: .mid),
                Answer(text: "Lauri, is that a boy, a girl, or a plant like the other one?", type: .fogey),
                Answer(text: "Run over and snag his face off!", type: .rocker)
            ]
        ),
        
        Question(
            text: "Here's a hard one, there's a rockers club on after school, the same time and day as your piano lesson. Do you...",
            answers: [
                Answer(text: "Piano is much more important!", type: .fogey),
                Answer(text: "Skip piano, I'm a rocker!", type: .rocker),
                Answer(text: "I don't play piano! Oh, we're imagining...I get it...", type: .mid)
            ]
        ),
        
        Question(
            text: "You see Jimmy Page looking at Hendrix albums in HMV. You approach him. He says \"Do...\" but before he finishes his sentence you've...",
            answers: [
                Answer(text: "Oh c'mon! Now your just making up people's names!", type: .fogey),
                Answer(text: "I'm too polite to interrupt", type: .mid),
                Answer(text: "Driven him back to my place, of course!", type: .rocker)
            ]
        ),
        
        Question(
            text: "You're spoilt for choice! You're meant to be going on a date with a cool guy/girl, but you COULD go to an Iron Maiden concert instead. Do you...",
            answers: [
                Answer(text: "Go to the concert, of course!", type: .rocker),
                Answer(text: "Ring the guy/girl and rearrange when to go", type: .mid),
                Answer(text: "Iron Maiden? Who are you, someone from the stone age?", type: .fogey)
            ]
        ),
        
        Question(
            text: "Oh my God! Jack and Meg White are splitting!",
            answers: [
                Answer(text: "Haa-ha, there last name is a colour!", type: .fogey),
                Answer(text: "NOOOOOOOOO!", type: .rocker),
                Answer(text: "Oh well, we all move on sometime", type: .mid)
            ]
        ),
        
        Question(
            text: "Don't worry, just testing. So, how do you feel now?",
            answers: [
                Answer(text: "How could you trick me like that? ", type: .mid),
                Answer(text: "...hay bails are rolling through my mind...", type: .fogey),
                Answer(text: "Phew. I love the White Stripes!", type: .rocker)
            ]
        ),
        
        Question(
            text: "It's the last question. Is rock the thing on your mind right...NOW!",
            answers: [
                Answer(text: "Nah, I've more important things to think about", type: .mid),
                Answer(text: "Rock is always on my mind", type: .rocker),
                Answer(text: "I'm hungry", type: .fogey)
            ]
        ),
    ]
    
    var answersChosen = [Answer]()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showResult",
        let destination = segue.destination as? ResultsViewController else { return }
        
        destination.answers = answersChosen
    }
    
    // MARK: - Methods
    func updateUI() {
        singleStackView.isHidden = true
        
        let question = questions[questionIndex]
        let answers = question.answers
        
        navigationItem.title = "Question № \(questionIndex + 1) of 10"
        questionLabel.text = question.text
        questionLabel.numberOfLines = 0
        
        updateSingleStack(with: answers)
    }
        
        func updateSingleStack (with answers: [Answer]) {
            singleStackView.isHidden = false
            
            guard singleButtons.count <= answers.count else { return }
            singleButtons.enumerated().forEach { $0.element.setTitle(answers[$0.offset].text, for: .normal) }
        }
    
    func nextQuestion () {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        guard let index = singleButtons.firstIndex(of: sender) else { return }
        
        let answer = answers[index]
        answersChosen.append(answer)
        nextQuestion()
    }
}
