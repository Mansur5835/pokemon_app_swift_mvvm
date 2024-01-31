//
//  ViewModel.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation




final class ViewModel: ObservableObject{
    private let pokemonManager = PokemonManager()
    private let networkManager = NetworkManager()
    
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var searchText: String =  ""
    @Published var errorMessage: String = ""
    @Published var isPresented: Bool = false
    
   
    
  
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList: pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init(){
        self.pokemonList = pokemonManager.getPokemon()
        networkManager.startLitsenForNetworkConnection{ message in
            self.errorMessage = message
            self.isPresented = true
            print(message)
        }
    
    }
    
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon){
            return index + 1;
        }
        return 0;
        
    }
    
    
    func getDetail(pokemon: Pokemon){
        let id = getPokemonIndex(pokemon: pokemon);
        self.pokemonDetails =  PokemonDetail(id: 0, height: 0, weight: 0)
        
        pokemonManager.getPokemonDetail(id: id) { detail in
            DispatchQueue.main.async {
                self.pokemonDetails = detail
            }
        }
        
    }
    
    func formatHW(value: Int)->String{
     let dValue = Double(value)
     let string = String(format: "%.2f", dValue / 10)
    return string;
    }
    
    
    
  
    
}
