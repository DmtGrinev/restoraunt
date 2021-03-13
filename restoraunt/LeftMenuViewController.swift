//
//  LeftMenuViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 28.02.2021.
//

import UIKit

class LeftMenuViewController: UIViewController{
    
    let cellSpacingHeight: CGFloat = 5
    
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
    
    var items = ["Бронь стола", "Акции и предложения", "Оставить отзыв", "Как нас найти"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLayout(with: self.view.frame.size)
        setupLeftMenuImageView()
        setupTableView()
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        coordinator.animate(alongsideTransition: { (context) in
//            self.updateLayout(with: size)
//        }, completion: nil)
//    }
//
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
}

//extension CategoryMenuViewController {}
//
private extension LeftMenuViewController {
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.register(LeftMenuTableViewCell.self, forCellReuseIdentifier: LeftMenuTableViewCell.reusedId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return cellSpacingHeight
//        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

