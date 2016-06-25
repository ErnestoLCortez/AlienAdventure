//
//  RedefinePolicingItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - UDPolicingError

enum UDPolicingError: ErrorType {
    case NameContainsLaser
    case ItemFromCunia
    case ValueLessThan10
}

extension Hero {
    
    func redefinePolicingItems() -> (UDItem throws -> Void) {
        
        func policingFilter(item: UDItem) throws -> Void {
            if let itemCheck = item.name.lowercaseString as? String where itemCheck.containsString("laser"){
                throw UDPolicingError.NameContainsLaser
            }
            else if let itemCheck = item.historicalData["PlanetOfOrigin"] as? String where itemCheck == "Cunia" {
                throw UDPolicingError.ItemFromCunia
            }
            else if let itemCheck = item.baseValue as? Int where itemCheck < 10 {
                throw UDPolicingError.ValueLessThan10
            }
        }
        
        return policingFilter        
    }    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 3"