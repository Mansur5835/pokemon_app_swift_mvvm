//
//  PokemonView.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import SwiftUI

struct PokemonView: View {
    
    @EnvironmentObject var vm: ViewModel
    let  pokemon: Pokemon
    let dimensions: Double = 140
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: Endpoints.pokemonImageById(id: vm.getPokemonIndex(pokemon: pokemon)))){ image in
              
                    image.resizable()
                        .scaledToFit()
                        .frame(width:dimensions, height: dimensions )
                
                
                
            } placeholder: {
                ProgressView().frame(width:dimensions, height: dimensions )
            }.background(.thinMaterial)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text("\(pokemon.name.capitalized)").font(.system(size: 16, weight: .regular, design:  .monospaced)).padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.mockPolkemon).environmentObject(ViewModel())
}
