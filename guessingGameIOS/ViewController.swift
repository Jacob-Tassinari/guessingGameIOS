//
//  ViewController.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/9/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    //mark: outlets
    @IBOutlet weak var playAgainButton: UIButton! // used to make the button hide and come back
    
    @IBOutlet weak var promt: UILabel! // to change the text for the min and max
    
    @IBOutlet weak var textfield: UITextField! // to take a aguess and run it through the program
    
    @IBOutlet weak var button: UIButton! // to actually submit the guess into the code
    
    @IBOutlet weak var highlow: UILabel! // it is the responding to the guesss given  high, low, win, and lose
    
    @IBOutlet weak var guessesRemaining: UILabel! // to tell how many guesses left
    
    @IBOutlet weak var diffrocultyButton: UIButton! // to send used to us back to the first screen
    
    //marK: oulets func
    @IBAction func playAgain(_ sender: Any) { // used to instance the restart func
        restarT()
    }
    @IBAction func buttonwhentapped(_ sender: Any) { // to test if they gave us a number
        let userINput = textfield.text!
         let userInput = userINput.replacingOccurrences(of: " ", with: "")
        guard let guess = Int(userInput) else {
            highlow.text = "You didn't give me a number."
            return
        }
        //print(randomNumber)// uncomment for testing and recomment when done
        makeAGuess(guess) // running the actual guessing game code
    }
    
    //mark: orginal propteries
    var randomNumber = Int.random(in: 1...100)
    var guesses = 5
    var min = 1
    var max = 100
    var setOfGuesses = 5// for the restart func
    
    //mark:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
        // so when you start the game it dosen't set it straight to just 1 - 100 - 5 and actually sends it with the right number of guesses, min, and max
        promt.text = "Please enter a number between \(min) - \(max)"
        guessesRemaining.text = "\(guesses) Guesses remaining 👀"
        restarT()
    }
    //mark" actual code for the game
    func makeAGuess(_ guess: Int) {
//        randomNumber = Int.random(in: min...max)// so it doesn't start out  1 - 100
        
        guard guess >= min && guess <= max else { // making sure its in the bonds of the game
            highlow.text = "Your number is not between \(min) and \(max)"
            return
        }
        if guess == randomNumber { // if you guess it in time
            highlow.text = "You win!"
            guessesRemaining.text = "You guessed the right number 🤯"
            setupUIForRestart()// ui restart setup instance
            return
        }
        if guesses == 1 { // if you run out of guesses
            highlow.text = "You lose..."
            guessesRemaining.text = "The number was \(randomNumber)"
            setupUIForRestart()// ui restart setup instance
            return
        }
            
        if guess < randomNumber { // runs the high low label to give feeback to the player
            highlow.text = "Your guess is too low"
        }else {
            highlow.text = "Your guess is too high"
        }
        guesses -= 1
        guessesRemaining.text = "\(guesses) Guesses remaining 👀"
        
    }
    func setupUIForRestart() { // to hide  and disenable buttons and also open buttons for restart
        textfield.isEnabled = false
        button.isHidden = true
        playAgainButton.isHidden = false
        diffrocultyButton.isHidden = false
    }
    func restarT() {// to actually restart the code
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

