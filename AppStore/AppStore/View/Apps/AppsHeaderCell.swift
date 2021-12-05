//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 04/12/21.
//

import Foundation
import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    var featuredApp: FeaturedApp! {
        didSet {
            enterpriseLabel.text = featuredApp.empresa
            descriptionLabel.text = featuredApp.descricao
            
            imageView.sd_setImage(with: URL(string: featuredApp.imagemUrl), completed: nil)
        }
    }
    
    let enterpriseLabel: UILabel = .textLabel(text: "Enterprise App", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App Description", fontSize: 20, numberOfLines: 2)
    let imageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        enterpriseLabel.textColor = UIColor.blueColor
        
        let stackView = UIStackView(arrangedSubviews: [enterpriseLabel, descriptionLabel, imageView])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
