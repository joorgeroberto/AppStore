//
//  SearchViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    let cellID = "cellID"
    
    var apps: [App] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
        
        extendedLayoutIncludesOpaqueBars = true;
        
        
    }
    
    func configureSearchBar() {
        navigationItem.searchController = self.searchController
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.frame.origin = CGPoint(x: 100, y: 1000)
        self.searchController.searchBar.placeholder = "Procurar"
        self.searchController.searchBar.delegate = self
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchApps(text: searchText)
    }
    
}

extension SearchViewController {
    func searchApps(text: String) {
        SearchService.shared.searchApps(text: text) { (apps, error) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath) as! SearchCell
        cell.app = self.apps[indexPath.item]
        return cell
    }
    
    // Set the spacing between sections
    override  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
}


