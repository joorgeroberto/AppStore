//
//  AppsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 04/12/21.
//

import Foundation
import UIKit

class AppsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellID = "cellID"
    let headerID = "headerID"
    var featuredApps: [FeaturedApp] = []
    var appGroups: [AppGroup] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self , forCellWithReuseIdentifier: cellID)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")
        self.getFeaturedApps()
        self.getAppGroup(type: "apps-que-amamos")
        self.getAppGroup(type: "top-apps-gratis")
        self.getAppGroup(type: "top-apps-pagos")
    }
}


extension AppsViewController {
    func getFeaturedApps() {
        AppService.shared.getFeaturedApps() { (apps, error) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.featuredApps = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func getAppGroup(type: String) {
        AppService.shared.getAppGroup(type: type) { (appGroup, error) in
            if let error = error {
                print(error)
                return
            }
            if let appGroup = appGroup {
                DispatchQueue.main.async {
                    self.appGroups.append(appGroup)
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension AppsViewController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppsHeader
        header.featuredApps = self.featuredApps
        header.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:  20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appGroups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsGroupCell
        cell.group = self.appGroups[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: CGFloat(250))
    }
    
}
