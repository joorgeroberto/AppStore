//
//  AppCommentCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 06/12/21.
//

import Foundation
import UIKit

class AppCommentCell: UICollectionViewCell {
    let titleLabel: UILabel = .textBoldLabel(text: "App muito bom", fontSize: 16)
    let commentLabel: UILabel = .textLabel(text: "App muito legal e funcional! Ajuda muito no meu dia a dia!", fontSize: 16, numberOfLines: 0)
    
    let evaluationStarsImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.commentBackgroundColor
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        evaluationStarsImageView.image = UIImage(named: "avaliacao-4")
        
        let headerStackView = UIStackView(arrangedSubviews: [titleLabel, evaluationStarsImageView])
        
        let commentStackView = UIStackView(arrangedSubviews: [commentLabel])
        commentStackView.alignment = .top
        
        let verticalStackView = UIStackView(arrangedSubviews: [headerStackView, commentStackView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
