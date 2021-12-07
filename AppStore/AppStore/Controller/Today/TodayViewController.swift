//
//  TodayViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellID = "cellID"
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        collectionView.backgroundColor = .commentBackgroundColor
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension TodayViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                tabBarController?.tabBar.isHidden = true
                let modalView = TodayDetailsViewController()
                modalView.modalPresentationStyle = .overCurrentContext
                self.present(modalView, animated: false) {
                    modalView.frame = frame
                    modalView.startAnimation()
                }
            }
        }
    }
}
