//
//  ReviewsCollectionViewCell.swift
//  restoraunt
//
//  Created by Dmitry Grinev on 30.03.2021.
//

import UIKit

class ReviewsCollectionViewCell: UICollectionViewCell {
    
   static let reusedId = "ReviewsCell"
    
    var reviewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var reviewLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryImageView()
        setupCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCategoryImageView() {
        addSubview(reviewImageView)
    }
    
    func setupCategoryLabel() {
        addSubview(reviewLabel)
    }
    override func layoutSubviews() {
        reviewImageView.frame = CGRect(x: 5,
                                       y: 5,
                                       width: contentView.frame.size.width,
                                       height: contentView.frame.size.height / 2)
        reviewLabel.frame = CGRect(x: 5,
                                       y: reviewImageView.frame.size.height,
                                       width: contentView.frame.size.width,
                                       height: contentView.frame.size.height - reviewImageView.frame.size.height)
    }
}
