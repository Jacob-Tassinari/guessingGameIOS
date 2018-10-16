//
//  selectdiffriculty.viewcontroller.swift
//  guessingGameIOS
//
//  Created by Jacob Tassinari on 10/11/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import UIKit

class selectDiffricultyViewController: UIViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// to run the right code to get the right diffricullty
        guard let guessingGameViewControlller = segue.destination as? ViewController else{ return }
        switch segue.identifier {
        case "easytoguess": //1 - 10 - 4
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 10
            guessingGameViewControlller.setOfGuesses = 4// for restart
            guessingGameViewControlller.guesses = 4
            break
        case "mediumToGuess": // 1 - 100 - 5
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 100
            guessingGameViewControlller.setOfGuesses = 5// for restart
            guessingGameViewControlller.guesses = 5
            break
        case "hardtoguess": // 1 - 500 - 7
            guessingGameViewControlller.min = 1
            guessingGameViewControlller.max = 500
            guessingGameViewControlller.setOfGuesses = 7// for restart
            guessingGameViewControlller.guesses = 7
            break
        default:
            break
        }
    }
    
}
