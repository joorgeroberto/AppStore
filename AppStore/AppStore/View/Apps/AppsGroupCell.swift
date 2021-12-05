//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit

class AppsGroupCell: UICollectionViewCell {
    let titleLabel: UILabel = .textBoldLabel(text: "App Title Label", fontSize: 24)
    let appsHorizontalGroupViewController = AppsHorizontalGroupViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        addSubview(titleLabel)
        titleLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right:  20)
        )
        addSubview(appsHorizontalGroupViewController.view)
        appsHorizontalGroupViewController.view.fill(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 10, left: 0, bottom: 0, right:  0)
        )

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
