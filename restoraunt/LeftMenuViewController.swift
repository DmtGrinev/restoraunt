//
//  LeftMenuViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 28.02.2021.
//

import UIKit

class LeftMenuViewController: UIViewController{
    
    var items = ["Наше меню", "Бронь стола", "Акции и предложения", "Оставить отзыв", "Как нас найти"]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()

    var leftMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLeftMenuImageView()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

private extension LeftMenuViewController {
    func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.register(LeftMenuTableViewCell.self, forCellReuseIdentifier: LeftMenuTableViewCell.reusedId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
     //   self.tableView.isScrollEnabled = false
        self.tableView.separatorStyle = .none
    }
}

private extension LeftMenuViewController {
    func setupLeftMenuImageView() {
        self.view.addSubview(leftMenuImageView)
        leftMenuImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        leftMenuImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        leftMenuImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        leftMenuImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuTableViewCell.reusedId, for: indexPath) as! LeftMenuTableViewCell
        cell.titleLeftMenuLabel.font = .systemFont(ofSize: 20)
        cell.backgroundColor = .yellow
        cell.titleLeftMenuLabel.textColor = .systemRed
        cell.titleLeftMenuLabel.textAlignment = .left
        cell.titleLeftMenuLabel.text = items[indexPath.row]
        cell.leftMenuCellImageView.image = UIImage(named: "Book")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionItem = indexPath.item
        var vc: UIViewController
        switch collectionItem {
        case 0:
            vc = RestMenuViewController()
        case 1:
            vc = CategoryMenuViewController()
        case 2:
            vc = PromotionViewController()
        case 3:
            vc = ReviewsViewController()
        case 4:
            vc = MapViewController()
        default:
            vc = RestMenuViewController()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return cellSpacingHeight
//        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

