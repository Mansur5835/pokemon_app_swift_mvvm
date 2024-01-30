//
//  ContentView.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm  = ViewModel()
    
    
    private let ataptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
  
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: ataptiveColumns, spacing: 10){
                    ForEach(vm.filteredPokemon){ pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)){
                            PokemonView(pokemon: pokemon)
                        }
                        
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Pokemon App")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
