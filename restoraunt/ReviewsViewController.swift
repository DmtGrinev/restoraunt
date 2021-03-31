//
//  ReviewsViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 22.03.2021.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    var collectionView: UICollectionView!
    private let sections: CGFloat = 2
    let review = Review.fetchReviews()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

}

extension ReviewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return review.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsCollectionViewCell.reusedId, for: indexPath) as! ReviewsCollectionViewCell
        cell.backgroundColor = .systemGray
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.reviewLabel.text = review[indexPath.item].reviewsTitle
        return cell
    }
}

// MARK: - Layout
extension ReviewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaces = collectionView.contentInset.left * (sections + 1)
        let width = collectionView.frame.width
        let height = (collectionView.frame.height - spaces) / sections
        return CGSize(width: width, height: height)
    }
    
    
    // MARK: - Navigation
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionItem = indexPath.item
        var vc: UIViewController
        if collectionItem == 0 {
            vc = SendReviewViewController()
        } else {
            vc = SendReviewViewController() // Make changes
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

private extension ReviewsViewController {
    func setupCollectionView() {
        self.collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(collectionView)
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isScrollEnabled = false
        self.collectionView.register(ReviewsCollectionViewCell.self, forCellWithReuseIdentifier: ReviewsCollectionViewCell.reusedId)
        self.collectionView.contentInset = UIEdgeInsets(top: 25, left: 16, bottom: 25, right: 16)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
    }
}
