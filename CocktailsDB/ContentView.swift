//
//  ContentView.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var drinks: [DrinkElement] = []

    var body: some View {
        NavigationView {
            List(drinks, id: \.idDrink) { drink in
                VStack(alignment: .leading) {
                        Text(drink.strDrink)
                            .font(.headline)
                        AsyncImage(url: URL(string: drink.strDrinkThumb)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.purple.opacity(0.1)
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(20)
                    
                }
            }
            .navigationTitle("Cocktails")
            .toolbar {
                                ToolbarItemGroup(placement: .navigationBarTrailing) {
                                    NavigationLink(destination: ContentView()) {
                                        Image(systemName: "person.crop.circle").font(.title)
                                    }
                                }
                            }
            .onAppear(perform: loadData)
        }
    }

    func loadData() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic") else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }

            let drinks = try! JSONDecoder().decode(Drink.self, from: data).drinks
            DispatchQueue.main.async {
                self.drinks = drinks
            }
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
