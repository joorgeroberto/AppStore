//
//  UIButton.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import Foundation
import UIKit

extension UIButton {
    static func getButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(UIColor.blueColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.size(size: .init(width: 80, height: 32))
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.clipsToBounds = true
        
        return button
    }
}
