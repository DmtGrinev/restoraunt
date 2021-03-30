//
//  CategoryCollectionViewCell.swift
//  restoraunt
//
//  Created by Tim Grinev on 27.02.2021.
//

import UIKit

class RestMenuCollectionViewCell: UICollectionViewCell {
    
    static let reusedId = "CategoryCell"
    
    var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var categoryLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryImageView.image = nil
        categoryLabel.text = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryImageView()
        setupCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCategoryImageView() {
        addSubview(categoryImageView)
        categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        categoryImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
    }
    
    func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: self.categoryImageView.bottomAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
