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
                Text(drink!.strDrink)
                    .font(.largeTitle)
                AsyncImage(url: URL(string: drink!.strDrinkThumb)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.blue.opacity(0.1)
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                HStack {
                    Text("Glass")
                        .font(.title2)
                    Text(drink!.strGlass)
                        .font(.subheadline)
                }
                HStack {
                    Text("Category")
                        .font(.title2)
                    Text(drink!.strCategory)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Alcoholic")
                        .font(.title2)
                    Text(drink!.strAlcoholic)
                        .font(.subheadline)
                }
                
                Text("Instructions")
                        .font(.title2)
                Text(drink!.strInstructions)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.subheadline)
                    .padding(.horizontal)
                
                Text("Ingredients")
                    .font(.title2)
                
                Group {
                    HStack {
                        Text(drink!.strIngredient1 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure1 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient2 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure2 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient3 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure3 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient5 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure5 ?? "")
                            .font(.subheadline)
                    }
                
                    HStack {
                        Text(drink!.strIngredient6 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure6 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient7 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure7 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient8 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure8 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient9 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure9 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient10 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure10 ?? "")
                            .font(.subheadline)
                    }
                }
                Group {
                    HStack {
                        Text(drink!.strIngredient11 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure11 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient12 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure12 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient13 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure13 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient14 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure14 ?? "")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(drink!.strIngredient15 ?? "")
                            .font(.subheadline)
                        Text(drink!.strMeasure15 ?? "")
                            .font(.subheadline)
                    }
                }
                    
                
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
        DetailView(idDrink: "14588")
    }
}
