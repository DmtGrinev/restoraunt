//
//  DishModel.swift
//  restoraunt
//
//  Created by Tim Grinev on 16.03.2021.
//

import Foundation
import UIKit

struct Dish {
    
    var dishImage: String
    var dishTitle: String
    var dishDescription: String
    var dishWeight: String
    var dishPrise: String

    static func fetchDish() -> [Dish] {
        var dishes = [Dish]()
            dishes.append(Dish(dishImage: "Салат1", dishTitle: "Цезарь", dishDescription: "Классический итальянский салат", dishWeight: "200гр", dishPrise: "560руб"))
        dishes.append(Dish(dishImage: "Салат2", dishTitle: "Оливье", dishDescription: "Классический итальянский салат", dishWeight: "200гр", dishPrise: "560руб"))
        dishes.append(Dish(dishImage: "Салат3", dishTitle: "Сельдь под шубой", dishDescription: "Классический итальянский салат", dishWeight: "200гр", dishPrise: "560руб"))
        dishes.append(Dish(dishImage: "Салат4", dishTitle: "Крабовый", dishDescription: "Классический итальянский салат", dishWeight: "200гр", dishPrise: "560руб"))
        dishes.append(Dish(dishImage: "Салат5", dishTitle: "Капрезе", dishDescription: "Классический итальянский салат", dishWeight: "200гр", dishPrise: "560руб"))
        return dishes
    }

}
