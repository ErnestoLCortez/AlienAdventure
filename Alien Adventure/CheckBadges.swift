//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        
        var badgeRequests = [UDRequestType]()
        
        for badge in badges {
            badgeRequests.append(badge.requestType)
        }
        
        for item in requestTypes {
            if !badgeRequests.contains(item) {
                return false
            }
        }
        return true
    }
    
}
