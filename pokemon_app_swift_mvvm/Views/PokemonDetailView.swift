//
//  PokemonDetailView.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    var body: some View {
        VStack{
            PokemonView(pokemon: pokemon)
            VStack(
                alignment: .center,
                spacing: 10){
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.pokemonDetails?.weight ?? 0) KG")
                Text("**Height**: \(vm.pokemonDetails?.height ?? 0) KG")
            }
        }
        .onAppear{
            vm.getDetail(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon:
                        Pokemon.mockPolkemon)
        .environmentObject(ViewModel())
}
