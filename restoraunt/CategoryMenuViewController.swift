//
//  CategoryMenuViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 01.03.2021.
//

import UIKit

class CategoryMenuViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

private extension CategoryMenuViewController {
    func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.register(CategoryMenuTableViewCell.self, forCellReuseIdentifier: CategoryMenuTableViewCell.reusedId)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}

extension CategoryMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryMenuTableViewCell.reusedId, for: indexPath) as! CategoryMenuTableViewCell
        cell.dishImageView.image = UIImage(named: "image")
        cell.backgroundColor = .systemTeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
