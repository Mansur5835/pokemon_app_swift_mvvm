//
//  NetworkManager.swift
//  pokemon_app_swift_mvvm
//
//  Created by Mansur Gulomov on 31/01/24.
//

import Foundation
import Network
import UIKit


class NetworkManager{
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    

    func startLitsenForNetworkConnection(completion: @escaping  (_ message: String) -> Void){
        monitor.pathUpdateHandler = {path in
            if path.status == .satisfied {
                print("internet is on.")
                completion("Network is available")
         
            } else{
                completion("Network is not available")
                print("internet is off.")
            }
        }
        
        monitor.start(queue: queue);
        print("listen started")
        
        
    }
    
}
