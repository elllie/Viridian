//
//  watercomparison.swift
//  Viridian
//
//  Created by Eleanor on 3/2/19.
//

import Foundation

extension Statistics {
    func waterImportance() -> String {
        let water = Float(calculateTable()[18])!
        
        switch (water) {
        case 15:
            return "That's about as much water as the human body contains."
        case Float(16)...Float(20):
            return "That's more than the amount of water in your body!"
        case Float(21)...Float(9999):
            let minutes = Int(water / 2.1)
            if (minutes >= 60) {
                let hours: Int = minutes / 60
                if (hours >= 24) {
                    let days: Int = hours / 24
                    return "That's enough water for a " + String(days) + "-day long shower. But please don't shower that long!"
                } else {
                    return "That's enough water for a " + String(hours) + "-hour long shower. But please don't shower that long."
                }
            } else {
                return "That's enough water for a " + String(minutes) + "-minute shower."
            }
        case 10000...20000:
            return "This is enough to fill a small residential swimming pool!"
        case 20001...40000:
            return "This much water will fill a swimming pool!"
        case 40001...60000:
            return "You could fill a large athletic pool with that amount of water!"
        case 60000...335999:
            return "This much water could fill " + String(Int(water / 44162)) + " swimming pools!"
        case 336000...660253.08:
            return "For comparison, riding Splash Mountain once uses 336,000 gallons of water."
        case 660253...264170000000:
            return "You've saved enough water to fill " + String(Int(water / 660253)) + " Olympic swimming pools!!!"
        default:
            return "WOW!! You've saved more water than there is in the entire ocean!!!"
        }
    }
}

//44,162 gallons in fitness center pool
//336,000 gallons to ride splash mountain once
//660,253.09 gallons in an olympic swimming pool
//264,170,000,000 gallons in the ocean
