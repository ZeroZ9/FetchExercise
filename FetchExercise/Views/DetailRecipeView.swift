//
//  DetailRecipeView.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import SwiftUI

struct DetailRecipeView: View {
    
    @State var word = "loading"
    @State var instruction = "loading"
    @State var mealID: String
    @ObservedObject var model = DetailModel()
    
    var body: some View {
        ScrollView {
            VStack{
                Text(word)
                Divider()
                Text(instruction)
                Divider()
                Text("Ingredients")
                Divider()
                ForEach(model.ingredientsList ?? [String](), id:\.self) { ingredient in
                    Text(ingredient)
                }
                Text("Measure")
                Divider()
            }
            .padding()

        }
        .onReceive(model.$isFetching) { isFetching in
            word = isFetching ? "loading" : model.detailsRecipe!.meals![0].strMeal!
            instruction = isFetching ? "loading" : model.detailsRecipe!.meals![0].strInstructions!
        }
        .task {
            model.fetching(idMeal: mealID)
        }
        .navigationTitle("Details")
    }
}
