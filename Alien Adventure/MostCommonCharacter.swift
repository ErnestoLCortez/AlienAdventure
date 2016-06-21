//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        if inventory.count < 1 {
        return nil
        }
        
        var charCounts = [Character:Int]()
        var maxChar: Character?
        var maxCount = 0
        
        for item in inventory {
            for chars in item.name.lowercaseString.characters {
                if charCounts[chars] != nil {
                    charCounts[chars]! += 1
                }
                else {
                    charCounts.updateValue(1, forKey: chars)
                }
            }
        }
        
        for item in charCounts {
            if item.1 > maxCount {
                maxCount = item.1
                maxChar = item.0
            }
        }
        return maxChar
    }
}
