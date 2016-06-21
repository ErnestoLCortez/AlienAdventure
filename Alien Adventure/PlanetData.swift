//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        let rawList = NSData(contentsOfURL: dataFileURL)!
        
        var importedList: [[String:AnyObject]]!
        do {
            importedList = try! NSJSONSerialization.JSONObjectWithData(rawList, options: NSJSONReadingOptions()) as! [[String:AnyObject]]
        }
        
        var mostIntriguingPlanet = ""
        var maxScore = -1
        
        for planet in importedList {
            if let name = planet["Name"] as? String {
                var totalPoints = 0
            
                if let commons = planet["CommonItemsDetected"] as? Int {
                    totalPoints += commons
                }
                if let uncommons = planet["UncommonItemsDetected"] as? Int{
                    totalPoints += uncommons * 2
                }
                if let rares = planet["RareItemsDetected"] as? Int {
                    totalPoints += rares * 3
                }
                if let legendaries = planet["LegendaryItemsDetected"] as? Int {
                    totalPoints += legendaries * 4
                }
                if totalPoints > maxScore {
                    mostIntriguingPlanet = name
                    maxScore = totalPoints
                }
            }
        }
        
        return mostIntriguingPlanet
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"