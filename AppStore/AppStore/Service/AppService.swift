//
//  AppService.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 04/12/21.
//

import Foundation
import UIKit

class AppService {
    static let shared = AppService()
    
    func searchFeaturedApps(completion: @escaping ([FeaturedApp]?, Error?) -> ()) {
        guard let url = URL(string: "http://localhost/app-store/v1/apps/apps-em-destaque") else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([FeaturedApp].self, from: data)
                completion(apps, nil)
            } catch let error {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
}
