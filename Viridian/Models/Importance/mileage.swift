//
//  mileage.swift
//  Viridian
//
//  Created by Eleanor on 3/13/19.
//

import Foundation

extension Statistics {
    func mileage() -> String {
        let miles = Float(calculateTable()[3])!
        switch (miles) {
        case 0...12:
            return "A journey of a thousand miles begins with a single step."
        case 13...25:
            return "You've run half a marathon!"
        case 26...51:
            return "You've run a marathon!"
        case 52...69:
            return "You've run two marathons!"
        case 70...249:
            return "Emperor penguins trek 70 miles each year."
        case 250...499:
            return "You've traveled more than the length of the world's first underground railway!"
        case 500...735:
            return "You've traveled more than the distance of the Serengeti!"
        case 736...989:
            return "You've traveled farther than the entire length of Italy!!"
        case 990...1599:
            return "You've traveled the entire length of New Zealand!!!"
        case 1600...1868:
            return "You've traveled the length of the world's largest coral reef system!!!!"
        case 1869...1996:
            return "You've traveled the entire length of Japan!!!!!"
        case 1997...2499:
            return "You've traveled the entire distance across India!!!!!!"
        case 2500...2982:
            return "Monarch butterflies migrate 2500 miles every year."
        default:
            return "Wow! You've traveled the entire length of the Sahara Desert!"
        }
    }
}
