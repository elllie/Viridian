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
        case 21:
            return "That's enough water for a 10-minute shower."
        default:
            return ""
        }
    }
}
