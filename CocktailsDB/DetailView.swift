//
//  DetailView.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 11/01/23.
//

import SwiftUI

struct DetailView: View {
    let idDrink: String
    @State var drink: DrinkDetail? = nil
    
    var body: some View {
        VStack {
            if drink != nil {
                AsyncImage(url: URL(string: drink!.strDrinkThumb)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.blue.opacity(0.1)
                }
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                Text(drink!.strDrink)
                Text(drink!.strInstructions)
                Text(drink!.strIngredient1)
                //aggiungere altri ingredienti e proprietà del drink
            } else {
                Text("Loading...")
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(idDrink)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }

            let drink = try! JSONDecoder().decode(DrinksDetail.self, from: data).drinks.first
            DispatchQueue.main.async {
                self.drink = drink
            }
        }.resume()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(idDrink: "12560")
    }
}
