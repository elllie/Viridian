//
//  kilowatthours.swift
//  Viridian
//
//  Created by Eleanor on 3/3/19.
//

import Foundation

extension Statistics {
    func kWhImportance() -> String {
        let kWh = Float(calculateTable()[1])!
        
        switch (kWh) {
        case 30...72:
            return "Enough to power the average home for a day."
        case 73...100:
            return "An internet router uses about this amount of power in a year."
        case 101...5999:
            let days = Int(kWh / 30)
            if (days > 7) {
                let weeks = Int(days / 7)
                return "Enough to power an average 4-bedroom home for " + String(weeks) + " weeks"
            } else if (days > 30) {
                let months = Int(days / 30)
                return "Enough to power an average 4-bedroom home for " + String(months) + " months"
            } else {
                return "Enough to power an average 4-bedroom home for " + String(days) + " days"
            }
        case 6000...9999:
            return "This is enough to power all of NYC Grand Central Terminal's lights for " + String(kWh / 6000) + " days!!"
        case 10000...10000000000:
            return "The average American home uses 10,950 kWh of energy per year."
        default:
            return ""
        }
    }
}

// 6000 kwh for a day of NYC Grand Central Terminal
