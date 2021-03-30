//
//  LeftMenuViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 28.02.2021.
//

import UIKit

class LeftSideMenuViewController: UIViewController{
    
    var items = ["Наше меню", "Бронь стола", "Акции и предложения", "Оставить отзыв", "Как нас найти"]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var leftMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupLeftMenuImageView()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

private extension LeftSideMenuViewController {
    func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.register(LeftSideMenuTableViewCell.self, forCellReuseIdentifier: LeftSideMenuTableViewCell.reusedId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: +100).isActive = true
        self.tableView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        self.tableView.isScrollEnabled = false
        self.tableView.separatorStyle = .none
    }
}

private extension LeftSideMenuViewController {
    func setupLeftMenuImageView() {
        self.view.addSubview(leftMenuImageView)
        leftMenuImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        leftMenuImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        leftMenuImageView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        leftMenuImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension LeftSideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftSideMenuTableViewCell.reusedId, for: indexPath) as! LeftSideMenuTableViewCell
        cell.titleLeftMenuLabel.font = .systemFont(ofSize: 20)
        cell.backgroundColor = .clear
        cell.titleLeftMenuLabel.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
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

