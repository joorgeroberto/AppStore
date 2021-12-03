//
//  UILabel.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import UIKit

extension UILabel {
    static func textLabel(text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text =  text
        
        return label
    }
}
