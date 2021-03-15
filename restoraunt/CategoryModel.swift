//
//  CategoryModel.swift
//  restoraunt
//
//  Created by Tim Grinev on 27.02.2021.
//

import Foundation
import UIKit

struct CategoryModel {
    
    var categoryImage: String
    var categoryTitle: String?
    
    
    
    static let restaurantNames = [
        "Горячее", "Закуски", "Супы", "Салаты", "Десерты", "Напитки"
    ]
    
    static func fetchCategory() -> [CategoryModel] {
        var categorys = [CategoryModel]()
        for category in restaurantNames {
            categorys.append(CategoryModel(categoryImage: category, categoryTitle: category))
        }
        return categorys
    }

}
