//
//  RecipeModel.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = Meals()
    @Published var detailsRecipe: DetailRecipe?
    
    init() {
        guard let url = URL(string: Constants.mealsUrl) else {
            print("Inavlid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the Data task
        let datatask = session.dataTask(with: request) { (data,response,error) in
            guard error == nil, let data = data else {
                print(error ?? "Error")
                return
            }
            
            do {
                // Parse json
                let decoder = JSONDecoder()
                let result = try decoder.decode(Meals.self, from: data)
                DispatchQueue.main.async { [self] in
                    self.recipes = result
                    recipes.meals!.sort { $0.strMeal! < $1.strMeal! }
                }
            } catch {
                print(error)
            }
        }
        
        // Start the data task
        datatask.resume()
    }
    
    func fetchDetails(_ id: String) {
        var components = URLComponents(string: Constants.fetchingUrl)
        components?.queryItems = [URLQueryItem(name: "i", value: id)]
        
        guard let url = components?.url else {
            print("Inavlid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the Data task
        let datatask = session.dataTask(with: request) { (data,response,error) in
            guard error == nil, let data = data else {
                print(error ?? "Error")
                return
            }
            
            do {
                // Parse json
                let decoder = JSONDecoder()
                let result = try decoder.decode(DetailRecipe.self, from: data)
                DispatchQueue.main.async { [self] in
                    self.detailsRecipe = result
                }
            } catch {
                print(error)
            }
        }
        
        // Start the data task
        datatask.resume()
    }
}
