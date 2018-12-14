//
//  customViewController.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/14/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit


class customViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    } 
    
    //mark: outlets
    @IBOutlet var labelForMinMax: UILabel!// to give feeback to the player why the input won't work
    
    @IBOutlet var minTextField: UITextField!
    
    @IBOutlet var maxTextField: UITextField!
    
    @IBOutlet var labelForGuesses: UILabel!// to give feeback to the player why the input won't work!
    
    @IBOutlet var guessTextField: UITextField! // to take
    
    @IBOutlet var labelForNumberChecking: UILabel!// to give feeback to the player why the input won't work
    
    @IBOutlet var checkButton: UIButton!// to hide the button
    
    @IBOutlet var goOnButton: UIButton! // to show the game page
    
    //mark: setup properties
    var minchecked:Int = 0 // to throw it into the prepare for segue func
    var maxchecked:Int = 0// to throw it into the prepare for segue func
    var guesseschecked:Int = 0// to throw it into the prepare for segue func
    
    //mark: setup ui protecion setting up the guessing game
    @IBAction func checkTapped(_ sender: Any) {
        //to run the if statement at the end of this func
        var minmax:Bool = false
        var guesses:Bool = false
        
        // to be able to use the text boxs
        let minInput = minTextField.text!
        let maxInput = maxTextField.text!
        let guessesInput = guessTextField.text!
        
        //checking if its a number
        guard let min = Int(minInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        labelForNumberChecking.isHidden = true // to re hide the label once they are all hidden
        
        //checking if its a number
        guard let max = Int(maxInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        labelForNumberChecking.isHidden = true // to re hide the label once they are all hidden
        
        //checking if its a number
        guard let guess = Int(guessesInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        labelForNumberChecking.isHidden = true // to re hide the label once they are all hidden
        
        //check if min is less than the max
        if min <  max {
            minmax = true
            labelForMinMax.isHidden = true
        } else {
            labelForMinMax.isHidden = false
            return
        }
        
        // to check if the amount of guesses is greater than zero
        if guess > 0  {
            guesses = true
            labelForGuesses.isHidden = true
        } else {
            labelForGuesses.isHidden = false
            return
        }
        
        //run the setup to send the values that the user gave and put it into the guessing game code
        if guesses && minmax {
            goOnButton.isHidden = false
            minTextField.isEnabled = false
            maxTextField.isEnabled = false
            guessTextField.isEnabled = false
            checkButton.isHidden = true
            minchecked = min
            maxchecked = max
            guesseschecked = guess
        }
    }
    
    
    //mark: run segue setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewControlller = segue.destination as? ViewController else{ return }
        switch segue.identifier {
        case "customSegue":
            guessingGameViewControlller.min = minchecked
            guessingGameViewControlller.max = maxchecked
            guessingGameViewControlller.guesses = guesseschecked
            guessingGameViewControlller.setOfGuesses = guesseschecked// for restart
            break
        default :
            break
        }
    }
}
