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
    var todayApp: TodayApp?
    
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
}
