//
//  TodayService.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 09/12/21.
//

import Foundation


class TodayService {
    static let shared = TodayService()
    let baseUrl = "http://localhost/app-store/v1"
    
    func getFeaturedTodayApps(completion: @escaping ([TodayApp]?, Error?) -> Void) {
        let todayApps: Array<TodayApp> = [
            TodayApp(
                id: 1,
                categoria: "VIAGEM",
                titulo: "Explore o mundo \n sem medo",
                imagemUrl: "destaque-1",
                descricao: "Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                backgroundColor: "#FFFFFF"
            ),
            TodayApp(
                id: 2,
                categoria: "PRATIQUE HOJE",
                titulo: "Mantenha o corpo \ne a mente saudáveis",
                imagemUrl: "destaque-2",
                descricao: "Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                backgroundColor: "#69CCE0"
            )
        ]
        
        completion(todayApps, nil)
    }
}
