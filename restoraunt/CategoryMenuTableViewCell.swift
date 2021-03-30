//
//  CategoryMenuTableViewCell.swift
//  restoraunt
//
//  Created by Tim Grinev on 01.03.2021.
//

import UIKit

class CategoryMenuTableViewCell: UITableViewCell {
    
    static let reusedId = "CategoryMenuCell"
    
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
        return imageView
    }()
    
    var titleDishLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var descriptionDishLabel: UILabel = {
        let label = UILabel()
      
        return label
    }()
    
    var weightDishLabel: UILabel = {
          let label = UILabel()
        
          return label
      }()
    
    var priceDishLabel: UILabel = {
        let label = UILabel()
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
    
    override func layoutSubviews() {
        dishImageView.frame = CGRect(x: 5,
                                     y: 5,
                                     width: 150,
                                     height: contentView.frame.size.height - 10)
        titleDishLabel.frame = CGRect(x: 10 + dishImageView.frame.size.width ,
                                      y: 5,
                                      width: contentView.frame.size.width - dishImageView.frame.size.width - 10,
                                      height: contentView.frame.size.height / 5)
        descriptionDishLabel.frame = CGRect(x: 10 + dishImageView.frame.size.width,
                                      y: titleDishLabel.frame.size.height,
                                      width: contentView.frame.size.width - dishImageView.frame.size.width - 10,
                                      height: contentView.frame.size.height - (titleDishLabel.frame.size.height * 2))
        weightDishLabel.frame = CGRect(x: 10 + dishImageView.frame.size.width,
                                       y: titleDishLabel.frame.size.height + descriptionDishLabel.frame.size.height,
                                      width: contentView.frame.size.width - dishImageView.frame.size.width - 10 - ((contentView.frame.size.width - dishImageView.frame.size.width) / 2),
                                      height: contentView.frame.size.height - 5 - (titleDishLabel.frame.size.height + descriptionDishLabel.frame.size.height))
        priceDishLabel.frame = CGRect(x: 10 + dishImageView.frame.size.width + weightDishLabel.frame.size.width,
                                       y: titleDishLabel.frame.size.height + descriptionDishLabel.frame.size.height,
                                      width: contentView.frame.size.width - dishImageView.frame.size.width - weightDishLabel.frame.size.width - 10,
                                      height: contentView.frame.size.height - 5 - (titleDishLabel.frame.size.height + descriptionDishLabel.frame.size.height))
    }
    

    func setupDishImageView() {
        contentView.addSubview(dishImageView)
        dishImageView.backgroundColor = .white
        dishImageView.contentMode = .scaleAspectFill
        dishImageView.layer.cornerRadius = 10
        dishImageView.clipsToBounds = true
    }
    
    func setupTitleDishLabel() {
        contentView.addSubview(titleDishLabel)
        titleDishLabel.backgroundColor = .white
        titleDishLabel.font = .boldSystemFont(ofSize: 18)
        titleDishLabel.textAlignment = .center
    }
    
    func setupDescriptionDishLabel() {
        contentView.addSubview(descriptionDishLabel)
        descriptionDishLabel.backgroundColor = .white
        descriptionDishLabel.numberOfLines = 0
        descriptionDishLabel.font = .systemFont(ofSize: 12)
    }
    
    func setupWeightDishLabel() {
        contentView.addSubview(weightDishLabel)
        weightDishLabel.backgroundColor = .white
        weightDishLabel.textAlignment = .center
    }
    
    func setupPriceDishLabel() {
        contentView.addSubview(priceDishLabel)
        priceDishLabel.backgroundColor = .white
    }
}
