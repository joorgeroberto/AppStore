//
//  TodayAppDetailsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayAppDetailsViewController: UITableViewController {
    let cellID = "cellID"
    
    var todayApp: TodayApp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(TodayAppDetailsCell.self, forCellReuseIdentifier: cellID)
        
        self.setupHeader()
    }
    
    func setupHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 480))
        headerView.backgroundColor = .red
        
        let todayCell = TodayCell()
        todayCell.todayApp = self.todayApp
        todayCell.layer.cornerRadius = 0

        headerView.addSubview(todayCell)
        todayCell.fillSuperView()
        
        self.tableView.tableHeaderView = headerView
    }
}

extension TodayAppDetailsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TodayAppDetailsCell
        
        return cell
    }
}
