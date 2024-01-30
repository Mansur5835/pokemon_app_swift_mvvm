//
//  Endpoints.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation


struct Endpoints {
    static let base = "https://pokeapi.co/api/v2";
    
    
    static func pokemonById(id: Int)->String{
        return "\(base)/pokemon/\(id)/";
    }
    
    
    static func pokemonImageById(id: Int)->String{
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/\(id).png";
    }
    
    

}
