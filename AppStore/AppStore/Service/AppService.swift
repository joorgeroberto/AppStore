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
    let baseUrl = "http://localhost/app-store/v1"
    
    func getFeaturedApps(completion: @escaping ([FeaturedApp]?, Error?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/apps/apps-em-destaque") else {return}
        
        
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
    
    func getAppGroup(type: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/apps/\(type)") else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(apps, nil)
            } catch let error {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
    
    func getAppByID(appID: Int, completion: @escaping (App?, Error?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/apps/\(appID)") else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                guard let data = data else {return}
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
            } catch let error {
                completion(nil, error)
                return
            }
            
        }.resume()
    }
    
    func getApps(completion: @escaping ([App]?, Error?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/apps") else {return}
        
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
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
