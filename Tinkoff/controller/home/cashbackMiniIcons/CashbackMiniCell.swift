//
//  CashbackMiniCell.swift
//  Tinkoff
//
//  Created by littl3rud3 ‍ on 28.12.2022.
//

import UIKit

class CashbackMiniCell: UICollectionViewCell {
    
    static let id = "cashbackMiniCell"
    
    var imageName: String!
    private var picture: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        picture = UIImageView(image: UIImage(named: imageName))
        picture.frame = bounds
        addSubview(picture)
    }
}
