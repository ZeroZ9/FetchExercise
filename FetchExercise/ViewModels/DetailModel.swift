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
                    measuresList = GetTheListOFMeasure(detailsRecipe!.meals![0])
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
        if meal.strIngredient1 != "" && meal.strIngredient1 != nil  {
            result.append(meal.strIngredient1 ?? "")
        }
        if meal.strIngredient2 != "" && meal.strIngredient2 != nil {
            result.append(meal.strIngredient2 ?? "")
        }
        if meal.strIngredient3 != "" && meal.strIngredient3 != nil {
            result.append(meal.strIngredient3 ?? "")
        }
        if meal.strIngredient4 != "" && meal.strIngredient4 != nil {
            result.append(meal.strIngredient4 ?? "")
        }
        if meal.strIngredient5 != "" && meal.strIngredient5 != nil {
            result.append(meal.strIngredient5 ?? "")
        }
        if meal.strIngredient6 != "" && meal.strIngredient6 != nil {
            result.append(meal.strIngredient6 ?? "")
        }
        if meal.strIngredient7 != "" && meal.strIngredient7 != nil {
            result.append(meal.strIngredient7 ?? "")
        }
        if meal.strIngredient8 != "" && meal.strIngredient8 != nil {
            result.append(meal.strIngredient8 ?? "")
        }
        if meal.strIngredient9 != "" && meal.strIngredient9 != nil {
            result.append(meal.strIngredient9 ?? "")
        }
        if meal.strIngredient10 != "" && meal.strIngredient10 != nil {
            result.append(meal.strIngredient10 ?? "")
        }
        if meal.strIngredient11 != "" && meal.strIngredient11 != nil {
            result.append(meal.strIngredient11 ?? "")
        }
        if meal.strIngredient12 != "" && meal.strIngredient12 != nil {
            result.append(meal.strIngredient12 ?? "")
        }
        if meal.strIngredient13 != "" && meal.strIngredient13 != nil {
            result.append(meal.strIngredient13 ?? "")
        }
        if meal.strIngredient14 != "" && meal.strIngredient14 != nil {
            result.append(meal.strIngredient14 ?? "")
        }
        if meal.strIngredient15 != "" && meal.strIngredient15 != nil {
            result.append(meal.strIngredient15 ?? "")
        }
        if meal.strIngredient16 != "" && meal.strIngredient16 != nil {
            result.append(meal.strIngredient16 ?? "")
        }
        if meal.strIngredient17 != "" && meal.strIngredient17 != nil{
            result.append(meal.strIngredient17 ?? "")
        }
        if meal.strIngredient18 != "" && meal.strIngredient18 != nil{
            result.append(meal.strIngredient18 ?? "")
        }
        if meal.strIngredient19 != "" && meal.strIngredient19 != nil{
            result.append(meal.strIngredient19 ?? "")
        }
        if meal.strIngredient20 != "" && meal.strIngredient20 != nil{
            result.append(meal.strIngredient20 ?? "")
        }
        return result
    }
    
    func GetTheListOFMeasure(_ meal: detail) -> [String] {
        var result = [String]()
        
        if meal.strMeasure1 != "" && meal.strMeasure1 != nil {
            result.append(meal.strMeasure1!)
        }
        if meal.strMeasure2 != "" && meal.strMeasure2 != nil {
            result.append(meal.strMeasure2!)
        }
        if meal.strMeasure3 != "" && meal.strMeasure3 != nil {
            result.append(meal.strMeasure3!)
        }
        if meal.strMeasure4 != "" && meal.strMeasure4 != nil {
            result.append(meal.strMeasure4!)
        }
        if meal.strMeasure5 != "" && meal.strMeasure5 != nil {
            result.append(meal.strMeasure5!)
        }
        if meal.strMeasure6 != "" && meal.strMeasure6 != nil {
            result.append(meal.strMeasure6!)
        }
        if meal.strMeasure7 != "" && meal.strMeasure7 != nil {
            result.append(meal.strMeasure7!)
        }
        if meal.strMeasure8 != "" && meal.strMeasure8 != nil {
            result.append(meal.strMeasure8!)
        }
        if meal.strMeasure9 != "" && meal.strMeasure9 != nil {
            result.append(meal.strMeasure9!)
        }
        if meal.strMeasure10 != "" && meal.strMeasure10 != nil {
            result.append(meal.strMeasure10!)
        }
        if meal.strMeasure11 != "" && meal.strMeasure11 != nil {
            result.append(meal.strMeasure11!)
        }
        if meal.strMeasure12 != "" && meal.strMeasure12 != nil {
            result.append(meal.strMeasure12!)
        }
        if meal.strMeasure13 != "" && meal.strMeasure13 != nil {
            result.append(meal.strMeasure13!)
        }
        if meal.strMeasure14 != "" && meal.strMeasure14 != nil {
            result.append(meal.strMeasure14!)
        }
        if meal.strMeasure15 != "" && meal.strMeasure15 != nil {
            result.append(meal.strMeasure15!)
        }
        if meal.strMeasure16 != "" && meal.strMeasure16 != nil {
            result.append(meal.strMeasure16!)
        }
        if meal.strMeasure17 != "" && meal.strMeasure17 != nil {
            result.append(meal.strMeasure17!)
        }
        if meal.strMeasure18 != "" && meal.strMeasure18 != nil {
            result.append(meal.strMeasure18!)
        }
        if meal.strMeasure19 != "" && meal.strMeasure19 != nil {
            result.append(meal.strMeasure19!)
        }
        if meal.strMeasure20 != "" && meal.strMeasure20 != nil {
            result.append(meal.strMeasure20!)
        }
        
        return result
    }
}
