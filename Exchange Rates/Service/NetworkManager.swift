//
//  NetworkManager.swift
//  Exchange Rates
//
//  Created by Michael Tseitlin on 7/11/19.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(dateString: String, completion: @escaping (Exchange?) -> Void) {
        
        let urlString = "https://api.privatbank.ua/p24api/exchange_rates?json&date=\(dateString)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            let exchange = try? JSONDecoder().decode(Exchange.self, from: data)
            
            completion(exchange)
            
            }.resume()
    }
}
