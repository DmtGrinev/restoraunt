//
//  NameReviewTableViewCell.swift
//  restoraunt
//
//  Created by Dmitry Grinev on 31.03.2021.
//

import UIKit

class NameReviewTableViewCell: UITableViewCell {
    
    static let reusedId = "ReviewNameCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameLabel()
        setupnameTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupnameTextField() {
        contentView.addSubview(nameTextField)
        nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
