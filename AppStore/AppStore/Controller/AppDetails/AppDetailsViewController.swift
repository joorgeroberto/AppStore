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
    }
}

extension AppDetailsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerID, for: indexPath) as! AppDetailsHeaderCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.bounds.width
        let height: CGFloat = 170
        
        return .init(width: width, height: height)
    }
}
