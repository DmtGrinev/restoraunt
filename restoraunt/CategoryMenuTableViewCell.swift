//
//  CategoryMenuTableViewCell.swift
//  restoraunt
//
//  Created by Tim Grinev on 01.03.2021.
//

import UIKit

class CategoryMenuTableViewCell: UITableViewCell {
    
    static var reusedId = "CategoryMenuCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDishImageView()
        setupTitleDishLabel()
        setupDescriptionDishLabel()
        setupPriceDishLabel()
        setupPriceDishLabel()
        setupWeightDishLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleDishLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionDishLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceDishLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var weightDishLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dishImageView.image = nil
        titleDishLabel.text = nil
        descriptionDishLabel.text = nil
        priceDishLabel.text = nil
        weightDishLabel.text = nil
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        dishImageView.frame = CGRect(x: 70, y: 70, width: 70, height: 70)
//    }
    

    func setupDishImageView() {
        addSubview(dishImageView)
        dishImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: contentView.frame.width * 0.7).isActive = true
        dishImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dishImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dishImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupTitleDishLabel() {
        addSubview(titleDishLabel)
        titleDishLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleDishLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +150).isActive = true
        titleDishLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleDishLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: +350).isActive = true
    }
    
    func setupDescriptionDishLabel() {
        addSubview(descriptionDishLabel)
        descriptionDishLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        descriptionDishLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +150).isActive = true
        descriptionDishLabel.topAnchor.constraint(equalTo: self.titleDishLabel.bottomAnchor).isActive = true
        descriptionDishLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupPriceDishLabel() {
        addSubview(priceDishLabel)
        priceDishLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        priceDishLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
  //      priceDishLabel.topAnchor.constraint(equalTo: self.categoryImageView.bottomAnchor).isActive = true
        priceDishLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupWeightDishLabel() {
        addSubview(weightDishLabel)
        weightDishLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        weightDishLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    //    weightDishLabel.topAnchor.constraint(equalTo: self.categoryImageView.bottomAnchor).isActive = true
        weightDishLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
