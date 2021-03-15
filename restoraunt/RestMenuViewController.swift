//
//  ViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 27.02.2021.
//

import UIKit
import SideMenu


class RestMenuViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var menu: SideMenuNavigationController?
    let category = CategoryModel.fetchCategory()
    private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        menu = SideMenuNavigationController(rootViewController: LeftMenuViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func tapMenu(_ sender: UIBarButtonItem) {
        present(menu!, animated: true, completion: nil)
    }
}

extension RestMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestMenuCollectionViewCell.reusedId, for: indexPath) as! RestMenuCollectionViewCell
        cell.backgroundColor = .systemYellow
        cell.categoryImageView.image = UIImage(named: category[indexPath.item].categoryImage)
        cell.categoryLabel.text = category[indexPath.item].categoryTitle  
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.categoryImageView.clipsToBounds = true
        return cell
    }
}

extension RestMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.1
        let spaces = collectionView.contentInset.left * (itemsPerRow + 1)
        let width = (collectionView.frame.width - spaces) / itemsPerRow
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

private extension RestMenuViewController {
    func setupCollectionView() {
        self.collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.backgroundColor = .systemGray2
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(RestMenuCollectionViewCell.self, forCellWithReuseIdentifier: RestMenuCollectionViewCell.reusedId)
        self.collectionView.contentInset = UIEdgeInsets(top: 25, left: 16, bottom: 25, right: 16)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
    }
}
