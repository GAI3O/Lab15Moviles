//
//  ContentView.swift
//  iOSAppTemplate
//
//  Created by Gabriel on 5/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ForEach(homeViewModel.pokemons, id: \.name) { pokemon in
                        CardView(pokemon: pokemon)
                    }
                }
                HStack {
                    HomeButtonView(imageName: "undo-button")
                    HomeButtonView(imageName: "dislike-button")
                    HomeButtonView(imageName: "super-like-button")
                    HomeButtonView(imageName: "like-button")
                    HomeButtonView(imageName: "flash-button")
                }
                .padding()
            }
            .task {
                homeViewModel.getPokemonByUserId()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
