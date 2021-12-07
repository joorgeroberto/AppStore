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
    let activityInficatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.greyColor
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
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
        view.addSubview(activityInficatorView)
        activityInficatorView.centerSuperView()
        self.getApps()
    }
}


extension AppsViewController {
    func getApps() {
        var featuredApps: [FeaturedApp]?
        var appsThatWeLove: AppGroup?
        var topFreeApps: AppGroup?
        var topPaidApps: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        AppService.shared.getFeaturedApps {(apps, error) in
            featuredApps = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.getAppGroup(type: "apps-que-amamos") {(appGroup, error) in
            appsThatWeLove = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.getAppGroup(type: "top-apps-gratis") {(appGroup, error) in
            topFreeApps = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppService.shared.getAppGroup(type: "top-apps-pagos") {(appGroup, error) in
            topPaidApps = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify( queue: .main) {
            if let apps = featuredApps {
                self.featuredApps = apps
            }
            if let apps = appsThatWeLove {
                self.appGroups.append(apps)
            }
            if let apps = topFreeApps {
                self.appGroups.append(apps)
            }
            if let apps = topPaidApps {
                self.appGroups.append(apps)
            }
            
            self.activityInficatorView.stopAnimating()
            self.collectionView.reloadData()
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
        cell.appsHorizontalGroupViewController.callback = { (app) in
            let appDetailsViewController = AppDetailsViewController()
            appDetailsViewController.appID = app.id
            appDetailsViewController.app = app
            self.navigationController?.pushViewController(appDetailsViewController, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: CGFloat(280))
    }
    
}
