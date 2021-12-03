//
//  SearchViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import UIKit

class SearchViewController: UITableViewController {
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
    }
    
}

extension SearchViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath) as! SearchCell
        
        return cell
    }
}
