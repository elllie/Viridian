//
//  Goal.swift
//  Viridian
//
//  Created by Eleanor on 6/25/19.
//

import Foundation
import UIKit

enum Rank {
    case blank
    case bronze
    case silver
    case gold
    case platinum
    case diamond
}

class Goal {
    var id: Int
    var title: String
    var body: String
    var bg: UIImage
    var image: UIImage
    var rank: Rank
    
    init(id: Int, title: String, body: String, bg: UIImage, image: UIImage, rank: Rank) {
        self.id = id
        self.title = title
        self.body = body
        self.bg = bg
        self.image = image
        self.rank = rank
    }
}
