//
//  Recipe.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    
    var id: String? {
        return idMeal
    }
}

struct Meals: Decodable {
    var meals: [Recipe]?
}
