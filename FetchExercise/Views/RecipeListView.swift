//
//  ContentView.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationStack {
            List(model.recipes.meals ?? [Recipe]()) { element  in
                NavigationLink {
                    DetailRecipeView(mealID: element.idMeal!)
                } label: {
                    HStack{
                        AsyncImage(url: URL(string: element.strMealThumb!)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        } placeholder: {
                             
                        }

                        Text(element.strMeal ?? "hihi")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Dessert Menu")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
