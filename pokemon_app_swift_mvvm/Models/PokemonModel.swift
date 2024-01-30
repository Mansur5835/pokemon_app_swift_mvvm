//
//  PokemonModel.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation


struct PokemonModel: Codable{
    let count: Int
    let next: String
    let results: [Pokemon]
}


struct Pokemon : Codable, Identifiable, Equatable{
    let id = UUID()
    let name: String
    let url: String
    
    
    static var mockPolkemon = Pokemon(name: "chikorita", url:"https://pokeapi.co/api/v2/pokemon/152/");
    
}


struct PokemonDetail: Codable{
    let id: Int
    let height: Int
    let weight: Int
}

