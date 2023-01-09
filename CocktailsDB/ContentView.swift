//
//  ContentView.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    var drinkName = "Drink"
    var body: some View {
        VStack {
            Text("\(drinkName)")
                .onAppear {
                    Task {
                        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic")!)
                        let decodedResponse = try? JSONDecoder().decode(Drink.self, from: data)
//                        ForEach(decodedResponse!.drinks) { drink in
//                            print(drink.strDrink)
//                        }
                        print(decodedResponse?.drinks[0].strDrink)
                    }
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
