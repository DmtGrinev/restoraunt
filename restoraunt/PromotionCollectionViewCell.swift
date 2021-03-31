//
//  PromotionCollectionViewCell.swift
//  restoraunt
//
//  Created by Dmitry Grinev on 31.03.2021.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    
    static let reusedId = "PromotionCell"
    
    var promotionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        promotionImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPromotionImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPromotionImageView() {
        addSubview(promotionImageView)
        promotionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        promotionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        promotionImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        promotionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

