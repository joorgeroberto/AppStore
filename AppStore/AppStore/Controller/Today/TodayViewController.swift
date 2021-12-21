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
    let multipleID = "multipleID"
    var todayApps: [TodayApp] = []
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
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: multipleID)
        
        self.getFeaturedTodayApps()
    }
    
    func getFeaturedTodayApps() {
        TodayService.shared.getFeaturedTodayApps { (todayApps, error) in
            if let todayApps = todayApps {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.todayApps = todayApps
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension TodayViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayCell
            cell.todayApp = self.todayApps[indexPath.item]
        
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleID, for: indexPath) as! TodayMultipleCell
            cell.todayApp = self.todayApps[indexPath.item]
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                tabBarController?.tabBar.isHidden = true
                let modalView = TodayDetailsViewController()
                modalView.modalPresentationStyle = .overCurrentContext
                
                modalView.onClose = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                
                let modalNavigation = UINavigationController(rootViewController: modalView)
                modalNavigation.modalPresentationStyle = .overCurrentContext
                modalNavigation.view.backgroundColor = .clear
                
                self.present(modalNavigation, animated: false) {
                    modalView.frame = frame
                    modalView.todayApp = self.todayApps[indexPath.item]
                }
            }
        }
    }
}
