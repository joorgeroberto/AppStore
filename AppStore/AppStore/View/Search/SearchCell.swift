//
//  SearchCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import Foundation
import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    var app: App! {
        didSet {
            titleLabel.text = app.nome
            enterpriseLabel.text = app.empresa
            
            imageViewIcon.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.firstScreenshot.sd_setImage(with: URL(string: app.screenshotUrls![0]), completed: nil)
                }
                if screenshotUrls.count > 1 {
                    self.secondScreenshot.sd_setImage(with: URL(string: app.screenshotUrls![1]), completed: nil)
                }
                if screenshotUrls.count > 2 {
                    self.thirdScreenshot.sd_setImage(with: URL(string: app.screenshotUrls![2]), completed: nil)
                }
            }
        }
    }
    
    
    let imageViewIcon: UIImageView = .imageViewIcon()
    let titleLabel: UILabel = .textLabel(text: "App Name", fontSize: 18, numberOfLines: 2)
    let enterpriseLabel: UILabel = .textLabel(text: "Enterprise Name", fontSize: 14, numberOfLines: 2)
    let getButton: UIButton = .getButton()
    
    let firstScreenshot: UIImageView = .screenshotImageView()
    let secondScreenshot: UIImageView = .screenshotImageView()
    let thirdScreenshot: UIImageView = .screenshotImageView()
    
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
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            firstScreenshot,
            secondScreenshot,
            thirdScreenshot
        ])
        screenshotStackView.spacing = 10
        screenshotStackView.distribution = .fillEqually
        let globalStackView = UIStackView(arrangedSubviews: [headerStackView, screenshotStackView])
        globalStackView.spacing = 16
        globalStackView.axis = .vertical

        addSubview(globalStackView)
        globalStackView.fillSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
