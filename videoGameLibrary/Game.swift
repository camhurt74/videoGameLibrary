//
//  Game.swift
//  videoGameLibrary
//
//  Created by Cameron Hurt on 9/10/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import Foundation

class Game {
    let title: String
    var checkedIn: Bool = true
    var dueDate: Date?
    
    
    init(title:String){
        self.title = title
     
    }
    
}

