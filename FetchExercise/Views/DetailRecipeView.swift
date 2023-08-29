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
    @State var imageurl = ""
    @ObservedObject var model = DetailModel()
    
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: URL(string: imageurl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    
                }
                VStack {
                    Text(word)
                        .font(.title)
                        .bold()
                    Divider()
                    Text(instruction)
                    Divider()
                    HStack(alignment: .top){
                        VStack{
                            Text("Ingredients")
                                .bold()
                            Divider()
                            ForEach(model.ingredientsList ?? [String](), id:\.self) { ingredient in
                                Text(ingredient)
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Measures")
                                .bold()
                            Divider()
                            ForEach(model.measuresList ?? [String](), id:\.self) { measure in
                                Text(measure)
                            }
                        }
                    }
                }.padding()
            }
        }
        .onReceive(model.$isFetching) { isFetching in
            
            // WAIT for the fetching to complete
            word = isFetching ? "loading" : model.detailsRecipe!.meals![0].strMeal!
            instruction = isFetching ? "loading" : model.detailsRecipe!.meals![0].strInstructions!
            imageurl = isFetching ? "" : model.detailsRecipe!.meals![0].strMealThumb!
        }
        .task {
            model.fetching(idMeal: mealID)
        }
        .navigationTitle("Details")
    }
}
