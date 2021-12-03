//
//  SearchCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import Foundation
import UIKit

class SearchCell: UITableViewCell {
    let imageViewIcon: UIImageView = .imageViewIcon()
    let titleLabel: UILabel = .textLabel(text: "App Name", fontSize: 18, numberOfLines: 2)
    let enterpriseLabel: UILabel = .textLabel(text: "Enterprise Name", fontSize: 14, numberOfLines: 2)
    let getButton: UIButton = .getButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let textStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            enterpriseLabel
        ])
        textStackView.spacing = 8
        textStackView.axis = .vertical
        
        let headerStackView = UIStackView(arrangedSubviews: [
            imageViewIcon,
            textStackView,
            getButton
        ])
        headerStackView.spacing = 12
        headerStackView.alignment = .center

        addSubview(headerStackView)
        headerStackView.fillSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
