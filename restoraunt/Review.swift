//
//  File.swift
//  restoraunt
//
//  Created by Dmitry Grinev on 30.03.2021.
//

import Foundation
import UIKit

struct Review {
    
    var reviewsImage: String
    var reviewsTitle: String?
    
    
    
    static let reviewsNames = [
        "Good 👍", "Bad 👎"
    ]
    
    static func fetchReviews() -> [Review] {
        var reviews = [Review]()
        for review in reviewsNames {
            reviews.append(Review(reviewsImage: review, reviewsTitle: review))
        }
        return reviews
    }
    
}
