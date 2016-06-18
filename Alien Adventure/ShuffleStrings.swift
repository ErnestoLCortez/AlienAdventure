//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        if s1 == "" && s2 == "" && shuffle == "" {
            return true
        }
        else if (s1.characters.count + s2.characters.count) != shuffle.characters.count{
            return false
        }
        else {
            var checkS1 = ""
            var checkS2 = ""
            for c in shuffle.characters {
                if s1.characters.contains(c) {
                    checkS1.append(c)
                }
                else if s2.characters.contains(c){
                    checkS2.append(c)
                }
            }
            if s1 == checkS1 && s2 == checkS2 {
                return true
            }
            return false
        }
    }
}
