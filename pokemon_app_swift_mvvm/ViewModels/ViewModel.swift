//
//  ViewModel.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation



final class ViewModel: ObservableObject{
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var searchText: String =  ""
    
  
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList: pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init(){
        self.pokemonList = pokemonManager.getPokemon()
        startLitsenForNetworkConnection()
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
    
    
    
    
    func startLitsenForNetworkConnection(){
        monitor.pathUpdateHandler = {path in
            if path.status == .satisfied {
                print("internet is on.")
            } else{
                print("internet is off.")
            }
        }
        
        monitor.start(queue: queue);
        print("listen started")
        
        
    }
    
    
}
