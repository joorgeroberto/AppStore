//
//  TodayHeader.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 21/12/21.
//

import Foundation
import UIKit

class TodayHeader: UICollectionReusableView {
    let dataLabel: UILabel = .textLabel(text: "TERÇA, 21 DE DEZEMBRO", fontSize: 14)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 36, height: 36))
        image.layer.cornerRadius = 18
        image.clipsToBounds = true
        image.image = UIImage(named: "perfil")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dataLabel)
        dataLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 32, left: 24, bottom: 0, right: 0)
        )
        
        addSubview(titleLabel)
        titleLabel.fill(
            top: nil,
            leading: leadingAnchor,
            trailing: nil,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 24, bottom: 0, right: 0)
        )
        
        addSubview(profileImageView)
        profileImageView.fill(
            top: nil,
            leading: nil,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
