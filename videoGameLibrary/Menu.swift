//
//  Menu.swift
//  videoGameLibrary
//
//  Created by Cameron Hurt on 9/11/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Menu {
    let gameLibrary = Library()
    var shouldQuit = false
    func quit() {
        
        shouldQuit = true
        print("Thanks for Using the Application")
    }
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
    func go() {
        
        while !shouldQuit{
            printMenu()
            var input = getInput()
            while validateInput(input) == false {
                printMenu()
                
                input = getInput()
            }
            handleInput(input)
            print("Would you like to go back to the library?")
            readLine()
            if readLine() == "Y" {
                printMenu()
            }; if readLine() == "N"  {
                quit()
            }
            
           
            
        }
    }
    func validateInput(_ input: String) -> Bool {
       let validMenuOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
        
    }
    
    func printMenu() {
        print("""
       Video Game Library
       1 Add Game
       2 Remove Game
       3 List Available Games
       4 Check Out Game
       5 Check In Game
       6 List Checked Out Games
       7 Quit
       8 Help

please enter a number between 1-8

""")
    }
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
           
           gameLibrary.addGame()
        case "2":
            gameLibrary.removeGame()
            case "3":
           gameLibrary.listAvaliableGames()
        case "4":
            gameLibrary.checkOutGame()
            
        case "5":
           gameLibrary.checkGameIn()
        case "6":
            gameLibrary.listCheckedOutGames()
        case "7":
            quit()
        case "8":
            printMenu()
            
        default:
            break
            
            
            
        }
        
        
    }
  
}


