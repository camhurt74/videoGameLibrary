//
//  library.swift
//  videoGameLibrary
//
//  Created by Cameron Hurt on 9/13/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Library {
    var gameArray : [Game] = [Game(title: "GTA V"), Game(title: "Nba 2k19"), Game(title: "Madden NFL 19"), Game(title: "Call of duty Black ops 2")]
    
    func addGame() {
        print("Please enter the title of the game you would like to add.")
        var newGameTitle = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid Title please enter the games title.")
            newGameTitle = readLine()
        }
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
        print("Your game has been added.")
        listAvaliableGames()
    }
    func listAvaliableGames() {
        for game in gameArray {
            print(game.title)
        }
    }
    func removeGame() {
        for index in 1..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        print("Please enter the number of the game you want to remove.")
        
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<gameArray.count)
        
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid input, please enter a valid index.")
            userInput = Int(readLine()!)
        }
        
        gameArray.remove(at: userInput!)
      
        
    }
    func checkOutGame() {
      
        
        for index in 1..<gameArray.count {
            if gameArray[index].checkedIn == true {
            print("\(index). \(gameArray[index].title)")
        }
            
         
       
        
        
    }
        print("Please enter the index of the game you would like to check out.")
        let userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input, please enter a usable index.")
        }
       gameArray[userInput!].checkedIn = false
        
        
        let currentCalender = Calendar.current
        let dueDate = currentCalender.date(byAdding: .day, value: 14, to: Date())
        gameArray[userInput!].dueDate = dueDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The game is due on : \(dateFormatter.string(from: dueDate!))")
}
    
    func checkGameIn() {
        for index in 1..<gameArray.count {
            if gameArray[index].checkedIn == false {
                print("\(index). \(gameArray[index].title)")
            }
            }
        print("Please enter the index of the game you would like to check in:")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input your input caused an error")
            userInput = Int(readLine()!)
            
        }
        gameArray[userInput!].checkedIn = true
        
        gameArray[userInput!].dueDate = nil
        print("You have checked the game back in.")
    }
    
    func listCheckedOutGames()  {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on:\(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
}

