//
//  LeftMenuTableViewCell.swift
//  restoraunt
//
//  Created by Tim Grinev on 06.03.2021.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {
    
    static let reusedId = "LeftMenuCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLeftMenuLabel()
        setupLeftMenuImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var leftMenuCellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLeftMenuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLeftMenuLabel.text = nil
        leftMenuCellImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTitleLeftMenuLabel() {
        contentView.addSubview(titleLeftMenuLabel)
        titleLeftMenuLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLeftMenuLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +50).isActive = true
        titleLeftMenuLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLeftMenuLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    func setupLeftMenuImageView() {
        contentView.addSubview(leftMenuCellImageView)
        leftMenuCellImageView.trailingAnchor.constraint(equalTo: self.titleLeftMenuLabel.leadingAnchor).isActive = true
        leftMenuCellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftMenuCellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftMenuCellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
