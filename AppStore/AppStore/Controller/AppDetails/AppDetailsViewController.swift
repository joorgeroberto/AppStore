//
//  AppDetailsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 05/12/21.
//

import Foundation
import UIKit

class AppDetailsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    let headerID = "headerID"
    let descriptionID = "descriptionID"
    let screenshotDetailsID = "screenshotDetailsID"
    let evaluationID = "evaluationID"
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsHeaderCell.self, forCellWithReuseIdentifier: headerID)
        collectionView.register(AppDetailsDescriptionCell.self, forCellWithReuseIdentifier: descriptionID)
        collectionView.register(AppScreenshotDetailsCell.self, forCellWithReuseIdentifier: screenshotDetailsID)
        collectionView.register(AppEvaluationDetailsCell.self, forCellWithReuseIdentifier: evaluationID)
        
    }
}

extension AppDetailsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        let isHeaderCell = indexPath.item == 0
        let isDescriptionCell = indexPath.item == 1
        let isScreenshotDetailsCell = indexPath.item == 2
        if(isHeaderCell) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerID, for: indexPath) as! AppDetailsHeaderCell
            
            return cell
        }
        if(isDescriptionCell) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionID, for: indexPath) as! AppDetailsDescriptionCell
            
            return cell
        }
        if(isScreenshotDetailsCell) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotDetailsID, for: indexPath) as! AppScreenshotDetailsCell
            return cell
        }
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: evaluationID, for: indexPath) as! AppEvaluationDetailsCell
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170
        
        let isDescriptionCell = indexPath.item == 1
        if(isDescriptionCell) {
            let descriptionCell = AppDetailsDescriptionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.layoutIfNeeded()
            
            // Adjusting cell height
            let estimatingCellSize = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimatingCellSize.height
        }
        
        let isScreenshotCell = indexPath.item == 2
        if(isScreenshotCell) {
            height = 550
        }
        
        let isEvaluationCell = indexPath.item == 3
        if(isEvaluationCell) {
            height = 280
        }
        
        return .init(width: width, height: height)
    }
}
