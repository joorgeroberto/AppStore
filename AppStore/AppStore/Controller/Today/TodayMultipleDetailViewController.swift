//
//  TodayMultipleDetailViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 18/12/21.
//

import Foundation
import UIKit

class TodayMultipleDetailViewController: UITableViewController {
    let cellID = "cellID"
    
    var handleClick: ((App) -> Void)?
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                let header = TodayMultipleHeader(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 145))
                header.todayApp = todayApp
                tableView.tableHeaderView = header
                tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 24)
        tableView.register(TodayMultipleAppCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TodayMultipleAppCell
        cell.app = todayApp?.apps?[indexPath.item]
        cell.leadingContraint?.constant = 24
        cell.trailingContraint?.constant = -24
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = self.todayApp?.apps?[indexPath.item] {
            self.handleClick?(app)
        }
    }
}
