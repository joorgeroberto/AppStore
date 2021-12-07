//
//  App.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 04/12/21.
//

import Foundation

struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avaliacao: String?
    let iconeUrl: String
    let descricao: String?
    let screenshotUrls: [String]?
    let comentarios: [Comment]?
}

struct FeaturedApp: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
}

struct AppGroup: Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}

struct Comment: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String
}
