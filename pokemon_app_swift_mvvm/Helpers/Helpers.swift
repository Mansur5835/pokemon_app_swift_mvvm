//
//  Helpers.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 30/01/24.
//

import Foundation


extension Bundle{
    func decode<T: Decodable>(file:String)-> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Could not load \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Could not load \(file) in bundle")
        }
        
        let decoder = JSONDecoder()
        guard let loadedData  = try? decoder.decode(T.self, from:data) else {
            fatalError("Could not load \(file) in bundle")
        }
        
        return loadedData
    }
        
    
    
    func fetchData<T: Decodable> (url: String, model: T.Type, completion: @escaping(T) -> (),
                                  failure: @escaping(Error) -> ()
    ){
        
        guard let url = URL(string: url) else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from:data)
                completion(serverData)
            } catch {
                failure(error)
            }
            
            
            
            
        }.resume()
        
    }
}
