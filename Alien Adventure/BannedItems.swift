//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        var bannedItems = [Int]()
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let importedList = NSArray(contentsOfURL: dataFileURL) as! [[String:AnyObject]]
        
        for item in importedList {
            if let historicalData = item["HistoricalData"] as? [String:AnyObject]{
                if let age = historicalData["CarbonAge"] as? Int where age < 30 {
                    print(age)
                    if let name = item["Name"] as? String where name.containsString("Laser") || name.containsString("laser"){
                        print(name)
                        bannedItems.append(item["ItemID"] as! Int)
                    }
                }
            }
        }
        return bannedItems
    }
}
// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"