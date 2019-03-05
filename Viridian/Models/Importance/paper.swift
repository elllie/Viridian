//
//  paper.swift
//  Viridian
//
//  Created by Eleanor on 3/3/19.
//

import Foundation

extension Statistics {
    
    func paperMeasurement() -> String {
        let sheets = Float(calculateTable()[14])! * 100.0
        if (sheets >= 500) {
            return String(Int(sheets / 500)) + " reams of paper saved"
        } else if (sheets >= 100) {
            return calculateTable()[14] + " lbs of paper saved"
        } else {
            return String(sheets) + " sheets of paper saved"
        }
    }
    
    func paperImportance() -> String {
        let sheets = Float(calculateTable()[14])! * 100.0
        switch (sheets) {
        case 0...99:
            return "This is roughly about " + calculateTable()[14] + " lbs worth."
        case 500...10000:
            return "All this paper put together would weigh " + calculateTable()[14] + " pounds!"
        case 150...170:
            return "That's roughly " + String(sheets) + " sheets, or around the length of Shakespeare's \"Hamlet\"."
        case 100...149:
            return "This is equivalent to " + String(sheets) + " sheets!"
        default:
            return "That's about " + String(Int(sheets / 15000)) + " trees worth!"
        }
    }
}
