//
//  TodayAppDetailsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayAppDetailsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.setupHeader()
    }
    
    func setupHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 480))
        headerView.backgroundColor = .red
        
        let todayCell = TodayCell()
        todayCell.layer.cornerRadius = 0

        headerView.addSubview(todayCell)
        todayCell.fillSuperView()
        
        self.tableView.tableHeaderView = headerView
    }
}
