//
//  shiftForward.swift
//  Vridian
//
//  Created by Eleanor on 3/2/19.
//

import Foundation

extension Array {
    mutating func shiftForward(idx: Int) {
        for i in (stride(from: self.count - 2, through: idx, by: -1)) {
            self[i+1] = self[i];
        }
    }
}
