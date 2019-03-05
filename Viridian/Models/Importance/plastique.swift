//
//  plastique.swift
//  Viridian
//
//  Created by Eleanor on 3/3/19.
//

import Foundation

extension Statistics {
    func plasticImportance() -> String {
        let coolFacts: [String] = ["160,000 plastic bags are used globally every second!", "Plastic takes over 1000 years to fully decompose!", "Only 1 to 3% of plastic bags are recycled worldwide.", "Each pound of plastic produces 6 lbs of carbon emissions."]
        return coolFacts.randomElement()!
    }
}
