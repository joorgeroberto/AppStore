//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit


class ScreenshotsCell: UICollectionViewCell {
    let imageView: UIImageView = .screenshotImageView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperView()
        imageView.image = UIImage(named: "screenshot")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
