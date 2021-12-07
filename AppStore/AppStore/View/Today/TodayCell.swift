//
//  TodayCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayCell: UICollectionViewCell {
    let categoryLabel: UILabel = .textLabel(text: "Travel", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore all the world. \n Find travel destination", fontSize: 28, numberOfLines: 2)
    let descriptionLabel: UILabel = .textLabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", fontSize: 14, numberOfLines: 3)
    let imageView: UIImageView = .todayImageView(named: "destaque-1")
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxImage = UIView()
        boxImage.clipsToBounds = true
        boxImage.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: boxImage.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxImage.centerYAnchor).isActive = true
        imageView.size(size: .init(width: bounds.width, height: 250))

        let stackView = UIStackView(arrangedSubviews: [categoryLabel,  titleLabel, boxImage, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.fillSuperView(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
}
