//
//  ViewController.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/9/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //mark:
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        restarT()
    }
    @IBOutlet weak var promt: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var highlow: UILabel!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var diffrocultyButton: UIButton!
    
    //marK:
    @IBAction func buttonwhentapped(_ sender: Any) {
        let userInput = textfield.text!
        guard let guess = Int(userInput) else {
            highlow.text = "You didn't give me a number."
            return
        }
        makeAGuess(guess)
    }
    
    //mark propteries
    var randomNumber = Int.random(in: 1...100)
    var guesses = 5
    var min = 1
    var max = 100
    var setOfGuesses = 5
    
    //mark:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        promt.text = "Please enter a number between \(min) - \(max)"
        guessesRemaining.text = "\(guesses) Guesses remaining 👀"
    }
    //mark
    func makeAGuess(_ guess: Int) {
        guard guess >= min && guess <= max else {
            highlow.text = "Your number is not between \(min) and \(max)"
            return
        }
        if guess == randomNumber {
            highlow.text = "You win!"
            setupUIForRestart()
            return
        }
        if guesses == 1 {
            highlow.text = "You lose..."
            setupUIForRestart()

            return
        }
            
        if guess < randomNumber {
            highlow.text = "Your guess is too low"
        }else {
            highlow.text = "Your guess is too high"
        }
        guesses -= 1
        guessesRemaining.text = "\(guesses) Guesses remaining 👀"
        
    }
    func setupUIForRestart() {
        textfield.isEnabled = false
        button.isHidden = true
        playAgainButton.isHidden = false
        guessesRemaining.text = " No Guesses remaining"
        diffrocultyButton.isHidden = false
    }
    func restarT() {
        // new random number
        randomNumber = Int.random(in: min...max)
        // reset guesses remaining
        guesses = setOfGuesses
        // clear text field
        textfield.text = ""
        // enable text field
        textfield.isEnabled = true
        // hide play again button
        playAgainButton.isHidden = true
        // show guess button
        button.isHidden = false
        // reset feedback label
        highlow.text = "lets go again 🤙"
        // reset guesses remaining label
        guessesRemaining.text = "\(guesses) Guesses remaining 👀"
        //prompt
        promt.text = "Please enter a number between \(min) - \(max)"
    }
}

