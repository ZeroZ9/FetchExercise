//
//  RecipeModel.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = Meals()
    
    init() {

        guard let url = URL(string: Constants.mealsUrl) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the Data task
        let datatask = session.dataTask(with: request) { (data,response,error) in
            guard error == nil, let data = data else {
                return
            }
            
            do {
                // Parse json
                let decoder = JSONDecoder()
                let result = try decoder.decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.recipes = result
                }
            } catch {
                print(error)
            }
        }
        
        // Start the data task
        datatask.resume()
    }
}
