//
//  TodayAppDetailsCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 08/12/21.
//

import Foundation
import UIKit

class TodayAppDetailsCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        let textAttribute = NSMutableAttributedString(
            string: "Lorem Ipsum",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        
        textAttribute.append(NSAttributedString(
            string: " dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        
        textAttribute.append(NSAttributedString(
            string: "\n\nDe onde ele vem?",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        )
        
        textAttribute.append(NSAttributedString(
            string: " dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        )
        
        label.attributedText = textAttribute
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperView(padding: .init(
            top: 24,
            left: 24,
            bottom: 24,
            right: 24
        ))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
