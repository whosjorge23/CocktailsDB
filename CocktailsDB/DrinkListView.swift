//
//  ContentView.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 09/01/23.
//

import SwiftUI

struct DrinkListView: View {
    var title : String
    var endpoint : String
    @State var drinks: [DrinkElement] = []
    @State var searchText = ""
        var filteredDrinks: [DrinkElement] {
            return drinks.filter {
                $0.strDrink.lowercased().contains(searchText.lowercased())
            }
        }

    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding()
                Button(action: {
                    // Perform search
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .padding()
            }
            .padding(.horizontal)
            List(searchText == "" ? drinks : filteredDrinks, id: \.idDrink) { drink in
                NavigationLink(destination: DrinkDetailView(idDrink: drink.idDrink)) {
                    VStack(alignment: .leading) {
                        Text(drink.strDrink)
                            .font(.title2)
                        AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.blue.opacity(0.1)
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(20)
                        
                    }
                }
            }
            .navigationTitle("\(title)")
            .onAppear(perform: loadData)
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


struct DrinkListView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkListView(title: "No-Alcholic", endpoint: "Non_Alcoholic")
    }
}
