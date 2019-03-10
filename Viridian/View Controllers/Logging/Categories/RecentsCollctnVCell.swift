//
//  CategoryCollectionViewCell.swift
//  Vridian
//
//  Created by Eleanor on 2/3/19.
//

import UIKit

class RecentsCollectionViewCell: UICollectionViewCell {
    
    let picture: UIImageView
    let label: UILabel
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        switch UIDevice().type {
        case .iPhone5, .iPhoneSE:
            picture = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        default:
            picture = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        }
        switch UIDevice().type {
        case .iPhone5, .iPhoneSE:
            label = UILabel(frame: CGRect(x: 0, y: picture.frame.size.height, width: frame.size.width, height: 75))
        default:
            label = UILabel(frame: CGRect(x: 0, y: picture.frame.size.height, width: frame.size.width, height: 65))
        }
        super.init(frame: frame)
        
        picture.contentMode = .scaleAspectFit
        contentView.addSubview(picture)
        
        
        label.font = UIFont(name: "Karla-Bold", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        contentView.addSubview(label)
    }
    
}
