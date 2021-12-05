//
//  AppsHorizontalGroupCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit

class AppsHorizontalGroupCell: UICollectionViewCell {
    let imageViewIcon: UIImageView = .imageViewIcon()
    let titleLabel: UILabel = .textLabel(text: "Title label", fontSize: 18, numberOfLines: 2)
    let enterpriseLabel: UILabel = .textLabel(text: "Enterprise Name", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.greyColor.cgColor
        layer.addSublayer(bottomLine)
        
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, enterpriseLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        
        let stackView = UIStackView(arrangedSubviews: [
            imageViewIcon,
            textStackView,
            getButton
        ])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperView()
    }
 
    required init?(coder: NSCoder) {
        fatalError()
    }
}