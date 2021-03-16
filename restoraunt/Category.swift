//
//  CategoryModel.swift
//  restoraunt
//
//  Created by Tim Grinev on 27.02.2021.
//

import Foundation
import UIKit

struct Category {
    
    var categoryImage: String
    var categoryTitle: String?
    
    
    
    static let restaurantNames = [
        "Горячее", "Закуски", "Супы", "Салаты", "Десерты", "Напитки"
    ]
    
    static func fetchCategory() -> [Category] {
        var categorys = [Category]()
        for category in restaurantNames {
            categorys.append(Category(categoryImage: category, categoryTitle: category))
        }
        return categorys
    }

}
