//
//  UIImageView.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import Foundation
import UIKit

extension UIImageView {
    static func imageViewIcon(width: CGFloat = 64, height: CGFloat = 64) -> UIImageView {
        let imageView = UIImageView()
        imageView.size(size: .init(width: width, height: height))
        imageView.backgroundColor = .purple
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    static func screenshotImageView() -> UIImageView {
        let imageView = UIImageView()
         
        imageView.backgroundColor = .purple
        imageView.layer.cornerRadius = 12
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        
        return imageView
    }
    
    static func todayImageView(named: String? = nil) -> UIImageView {
        let imageView = UIImageView()
         
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
