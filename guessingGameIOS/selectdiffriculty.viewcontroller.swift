//
//  selectdiffriculty.viewcontroller.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/11/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class selectDiffricultyViewController: UIViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let guessingGameViewControlller = segue.destination as? ViewController else{ return }
        switch segue.identifier {
        case "easytoguess":
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 10
            guessingGameViewControlller.setOfGuesses = 4
            guessingGameViewControlller.guesses = 4
            break
        case "mediumToGuess":
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 100
            guessingGameViewControlller.setOfGuesses = 5
            guessingGameViewControlller.guesses = 5
            break
        case "hardtoguess":
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 500
            guessingGameViewControlller.setOfGuesses = 7
            guessingGameViewControlller.guesses = 7
            break
        default:
            break
        }
    }
    
}
