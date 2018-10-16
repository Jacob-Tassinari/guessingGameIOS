//
//  customViewController.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/14/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit


class customViewController: UIViewController{
    
    //mark: outlets


    
    
//    @IBOutlet weak var minTextField: UILabel!
//    @IBOutlet weak var maxTextField: UILabel!
//    @IBOutlet weak var guessTextField: UITextField!
//    @IBOutlet weak var goOnButton: UIButton!
//    @IBOutlet weak var checkButton: UIButton!
//    @IBOutlet weak var labelForNumberChecking: UILabel!
//    @IBOutlet weak var labelForMinMax: UILabel!
//    @IBOutlet weak var labelForGuesses: UILabel!
    @IBOutlet var labelForMinMax: UILabel!
    @IBOutlet var minTextField: UITextField!
    @IBOutlet var maxTextField: UITextField!
    @IBOutlet var labelForGuesses: UILabel!
    @IBOutlet var guessTextField: UITextField!
    @IBOutlet var labelForNumberChecking: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var goOnButton: UIButton!
    
    //mark: setup properties
    var minchecked:Int = 0
    var maxchecked:Int = 0
    var guesseschecked:Int = 0
    
    //mark: setup ui protecion setting up the guessing game
    @IBAction func checkTapped(_ sender: Any) {
        var minmax:Bool = false
        var guesses:Bool = false
        let minInput = minTextField.text!
        let maxInput = maxTextField.text!
        let guessesInput = guessTextField.text!
        guard let min = Int(minInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        labelForNumberChecking.isHidden = true
        guard let max = Int(maxInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        guard let guess = Int(guessesInput) else {
            labelForNumberChecking.isHidden = false
            return
        }
        if min <  max {
            minmax = true
            labelForMinMax.isHidden = true
        } else {
            labelForMinMax.isHidden = false
            return
        }
        if guess > 0  {
            guesses = true
            labelForGuesses.isHidden = true
        } else {
            labelForGuesses.isHidden = false
            return
        }
        
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
            guessingGameViewControlller.setOfGuesses = guesseschecked
            break
        default :
            break
        }
    }
}
