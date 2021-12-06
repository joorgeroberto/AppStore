//
//  AppDetailsDescriptionCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit

class AppDetailsDescriptionCell: UICollectionViewCell {
    let titleLabel: UILabel = .textBoldLabel(text: "App title description", fontSize: 24)
    let descriptionLabel: UILabel = .textLabel(text: "App description", fontSize: 12, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
