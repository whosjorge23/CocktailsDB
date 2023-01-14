//
//  DrinkController.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 14/01/23.
//

import Foundation

class DrinkController : ObservableObject {
    var title : String?
    var endpoint : String?
    var drinks: [DrinkElement] = []
    var searchText = ""
    var filteredDrinks: [DrinkElement] {
        return drinks.filter {
            $0.strDrink.lowercased().contains(searchText.lowercased())
        }
    }

    func loadData() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=\(endpoint)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let drinks = try! JSONDecoder().decode(Drink.self, from: data).drinks
            DispatchQueue.main.async {
                self.drinks = drinks
            }
        }.resume()
    }
}
