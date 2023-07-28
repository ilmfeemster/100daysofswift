//
//  ViewController.swift
//  Consolidation4
//
//  Created by Immanuel Matthews-Feemster on 7/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    var gameTitle: UITextField!
    var gameDirections: UITextField!
    var currentAnswer: UITextField!
    var usedLetters: UITextField!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        gameTitle = UITextField()
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        gameTitle.placeholder = "Hangman"
        gameTitle.textAlignment = .center
        gameTitle.font = UIFont.systemFont(ofSize: 44)
        gameTitle.isUserInteractionEnabled = false
        view.addSubview(gameTitle)
        
        gameDirections = UITextField()
        gameDirections.translatesAutoresizingMaskIntoConstraints = false
        gameDirections.placeholder = "Guess a letter."
        gameDirections.textAlignment = .center
        gameDirections.font = UIFont.systemFont(ofSize: 22)
        gameDirections.isUserInteractionEnabled = false
        view.addSubview(gameDirections)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.textAlignment = .center
        currentAnswer.placeholder = "???????"
        currentAnswer.font = UIFont.systemFont(ofSize: 24)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        usedLetters = UITextField()
        usedLetters.translatesAutoresizingMaskIntoConstraints = false
        usedLetters.textAlignment = .center
        usedLetters.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(usedLetters)
        
        let guess = UIButton(type: .system)
        guess.translatesAutoresizingMaskIntoConstraints = false
        guess.setTitle("GUESS", for: .normal)
        view.addSubview(guess)
        
        guess.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            gameTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            currentAnswer.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 50),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameDirections.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 20),
            gameDirections.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            guess.topAnchor.constraint(equalTo: gameDirections.bottomAnchor, constant: 10),
            guess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usedLetters.topAnchor.constraint(equalTo: guess.bottomAnchor, constant: 50),
            usedLetters.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func guessButtonTapped() {
        let ac = UIAlertController(title: "Enter a Letter", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit", style: .default))
        present(ac, animated: true)
    }

}

