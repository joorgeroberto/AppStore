//
//  AppDetailsHeaderCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit

class AppDetailsHeaderCell: UICollectionViewCell {
    let iconImageView: UIImageView = .imageViewIcon(width: 128, height: 128)
    let nameLabel: UILabel = .textLabel(text: "App Name", fontSize: 20, numberOfLines: 2)
    let enterpriseLabel: UILabel = .textLabel(text: "Enterprise Name", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [getButton, UIView()])
        
        let verticalStackView = UIStackView(arrangedSubviews: [nameLabel, enterpriseLabel, buttonStackView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        let horizontalStackView = UIStackView(arrangedSubviews: [iconImageView, verticalStackView])
        addSubview(horizontalStackView)
        horizontalStackView.spacing = 12
        horizontalStackView.alignment = .center
        horizontalStackView.fillSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
