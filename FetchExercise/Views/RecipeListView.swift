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
                    Text("mlem")
                } label: {
                    Text(element.strMeal ?? "hihi")
                }
            }
            .navigationTitle("Recipte")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
