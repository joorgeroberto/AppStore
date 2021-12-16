//
//  TodayMultipleAppCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 15/12/21.
//

import Foundation
import UIKit
import SDWebImage

class TodayMultipleAppCell: UITableViewCell {
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                enterpriseLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .imageViewIcon(width: 48, height: 48)
    let titleLabel: UILabel = .textLabel(text: "App Name", fontSize: 16)
    let enterpriseLabel: UILabel = .textLabel(text: "App Enterprise", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, enterpriseLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        verticalStackView.alignment = .leading
        
        let horizontalStackView = UIStackView(arrangedSubviews: [iconImageView, verticalStackView, getButton])
        horizontalStackView.spacing = 16
        horizontalStackView.alignment = .center
        
        addSubview(horizontalStackView)
        horizontalStackView.fillSuperView(padding: .init(top: 14, left: 0, bottom: 14, right: 0))
    }
    
    
}
