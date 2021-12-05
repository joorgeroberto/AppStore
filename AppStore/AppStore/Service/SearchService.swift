//
//  SearchService.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 03/12/21.
//

import UIKit

class SearchService {
    static let shared = SearchService()
    
    func searchApps(text: String, completion: @escaping ([App]?, Error?) -> ()) {
        guard let url = URL(string: "http://localhost/app-store/v1/apps?search=\(text )") else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, res, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([App].self, from: data)
                completion(apps, nil)
                
            } catch let error {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
}
