//
//  LeastValuableItem.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func leastValuableItem(inventory: [UDItem]) -> UDItem? {
        if inventory.count < 1 {
        return nil
        }
        else {
            var min = inventory[0].baseValue
            var rubbish: UDItem? = inventory[0]
            for item in inventory{
                if item.baseValue < min {
                    min = item.baseValue
                    rubbish = item
                }
            }
            return rubbish
        }
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"