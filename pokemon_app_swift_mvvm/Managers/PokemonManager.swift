//
//  PokemonManager.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation
import Network

class PokemonManager{

    func getPokemon()-> [Pokemon] {
        let data: PokemonModel = Bundle.main.decode(file: "pokemon.json")
        let pokemon:[Pokemon] = data.results;
        
        return pokemon;
    }
    
    
    func getPokemonDetail(id: Int, _ complation: @escaping(PokemonDetail) -> ()) {
        
        Bundle.main.fetchData(url: Endpoints.pokemonById(id: id), model: PokemonDetail.self){ data in
            complation(data)
            
        } failure: { error in
            print(error)
        }
    }
}
