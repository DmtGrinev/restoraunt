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
        var dishes = [CategoryModel]()
        for dish in restaurantNames {
            dishes.append(CategoryModel(categoryImage: dish, categoryTitle: dish))
        }
        
        return dishes
    }
    
//    func fetchCategory() -> [CategoryModel] {
//
//        let item1 = CategoryModel(categoryImage: UIImage(named: "Балкан Гриль")) //, categoryTitle: "very teasty")
//        let item2 = CategoryModel(categoryImage: UIImage(named: "Бочка")) //, categoryTitle: "very teasty")
//        let item3 = CategoryModel(categoryImage: UIImage(named: "Вкусные истории")) //, categoryTitle: "very teasty")
//        print(item1)
//        return [item1, item2, item3]
//    }
}
