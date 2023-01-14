//
//  MainView.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 11/01/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.center,spacing: 50) {
                NavigationLink(destination: DrinkListView(title: "Alcoholic", endpoint: "Alcoholic")) {
                    VStack {
                        AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/1584/1584725.png")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.blue.opacity(0.1)
                        }
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        Text("Alcoholic").font(.title)
                    }
                }
                NavigationLink(destination: DrinkListView(title: "Non-Alcoholic", endpoint: "Non_Alcoholic")) {
                    VStack {
                        AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/5290/5290825.png")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.blue.opacity(0.1)
                        }
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        Text("Non-Alcoholic").font(.title)
                    }
                }
            }
            .navigationTitle("Cocktails")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
