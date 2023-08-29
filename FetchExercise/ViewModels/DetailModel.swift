//
//  DetailModel.swift
//  FetchExercise
//
//  Created by Long Tran M2 on 28/8/23.
//

import Foundation

class DetailModel: ObservableObject {

    @Published var detailsRecipe: DetailRecipe?
    @Published var isFetching = true
    @Published var ingredientsList: [String]?
    @Published var measuresList: [String]?
    var idMeal: String?
    
    
    func fetching(idMeal: String) {
        ingredientsList = [String]()
        measuresList = [String]()
        var components = URLComponents(string: Constants.fetchingUrl)
        components?.queryItems = [URLQueryItem(name: "i", value: idMeal)]
        
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
                    isFetching = false
                    ingredientsList = GetTheListOFIngredient(detailsRecipe!.meals![0])
                    // get the ingredients list
                   
                    
                }
            } catch {
                print(error)
            }
        }
        
        // Start the data task
        datatask.resume()
    }
    
    func GetTheListOFIngredient(_ meal: detail) -> [String] {
        var result = [String]()
        if meal.strIngredient1 != "" {
            result.append(meal.strIngredient1 ?? "")
        }
        if meal.strIngredient2 != "" {
            result.append(meal.strIngredient2 ?? "")
        }
        if meal.strIngredient3 != "" {
            result.append(meal.strIngredient3 ?? "")
        }
        if meal.strIngredient4 != "" {
            result.append(meal.strIngredient4 ?? "")
        }
        if meal.strIngredient5 != "" {
            result.append(meal.strIngredient5 ?? "")
        }
        if meal.strIngredient6 != "" {
            result.append(meal.strIngredient6 ?? "")
        }
        if meal.strIngredient7 != "" {
            result.append(meal.strIngredient7 ?? "")
        }
        if meal.strIngredient8 != "" {
            result.append(meal.strIngredient8 ?? "")
        }
        if meal.strIngredient9 != "" {
            result.append(meal.strIngredient9 ?? "")
        }
        if meal.strIngredient10 != "" {
            result.append(meal.strIngredient10 ?? "")
        }
        if meal.strIngredient11 != "" {
            result.append(meal.strIngredient11 ?? "")
        }
        if meal.strIngredient12 != "" {
            result.append(meal.strIngredient12 ?? "")
        }
        if meal.strIngredient13 != "" {
            result.append(meal.strIngredient13 ?? "")
        }
        if meal.strIngredient14 != "" {
            result.append(meal.strIngredient14 ?? "")
        }
        if meal.strIngredient15 != "" {
            result.append(meal.strIngredient15 ?? "")
        }
        if meal.strIngredient16 != "" {
            result.append(meal.strIngredient16 ?? "")
        }
        if meal.strIngredient17 != "" {
            result.append(meal.strIngredient17 ?? "")
        }
        if meal.strIngredient18 != "" {
            result.append(meal.strIngredient18 ?? "")
        }
        if meal.strIngredient19 != "" {
            result.append(meal.strIngredient19 ?? "")
        }
        if meal.strIngredient20 != "" {
            result.append(meal.strIngredient20 ?? "")
        }
        return result
    }
}
