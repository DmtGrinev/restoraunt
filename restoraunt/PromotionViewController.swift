//
//  PromotionViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 22.03.2021.
//

import UIKit

class PromotionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    private let sections: CGFloat = 4
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    

}

extension PromotionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reusedId, for: indexPath) as! PromotionCollectionViewCell
        cell.backgroundColor = .systemGray
        cell.promotionImageView.image = UIImage(named: "Promotion")
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
      //  cell.categoryImageView.clipsToBounds = true
        return cell
    }
    
    // MARK: - Navigation
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionItem = indexPath.item
        var vc: UIViewController
        if collectionItem == 0 {
            vc = DetailPromotionViewController()
        } else {
            vc = DetailPromotionViewController() // Make changes
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - Layout
extension PromotionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaces = collectionView.contentInset.left * (sections + 1)
        let width = collectionView.frame.width
        let height = (collectionView.frame.height - spaces) / sections
        return CGSize(width: width, height: height)
    }
    
    
}
extension PromotionViewController {
        func setupCollectionView() {
            self.collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
            self.view.addSubview(collectionView)
            self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.collectionView.backgroundColor = .white
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: PromotionCollectionViewCell.reusedId)
            self.collectionView.contentInset = UIEdgeInsets(top: 25, left: 16, bottom: 25, right: 16)
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.estimatedItemSize = .zero
    }
}
