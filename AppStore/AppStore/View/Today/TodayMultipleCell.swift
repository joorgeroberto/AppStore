//
//  TodayMultipleCell.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 15/12/21.
//

import Foundation
import UIKit

class TodayMultipleCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                categoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo
                tableView.reloadData()
            }
        }
    }
    
    let cellID = "cellID"
    let categoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TodayMultipleAppCell.self, forCellReuseIdentifier: cellID)
        
        let stackView = UIStackView(arrangedSubviews: [
            categoryLabel,
            titleLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.fill(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
        
        addSubview(tableView)
        tableView.fill(
            top: stackView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TodayMultipleAppCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }
}
