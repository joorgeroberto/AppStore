//
//  TodayApp.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 09/12/21.
//

import Foundation
import UIKit

struct TodayApp {
    let id: Int
    let categoria: String
    let titulo: String
    let imagemUrl: String?
    let descricao: String?
    let backgroundColor: String?
    let apps: [App]?
}
