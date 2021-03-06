//
//  TodayDetailsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayDetailsViewController: UIViewController {
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                if todayApp.apps == nil {
                    self.renderSimpleTodayAppDetails()
                }
                else {
                    self.renderMultipleTodayAppDetails()
                }
            }
        }
    }
    
    var centerView: UIView?
    var frame: CGRect?
    
    let closeButton: UIButton = .closeButton()
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let todayAppDetailsViewController = TodayAppDetailsViewController()
    let todayMultipleDetailViewController = TodayMultipleDetailViewController()
    
    var onClose: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func renderCloseButton() {
        view.addSubview(closeButton)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(handleCloseButtonAction), for: .touchUpInside)
        closeButton.fill(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 18, left: 0, bottom: 0, right: 24),
            size: .init(width: 32, height: 32)
        )
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: {
            self.closeButton.alpha = 1
        }, completion: nil)
    }
    
    func renderSimpleTodayAppDetails() {
        todayAppDetailsViewController.todayApp = self.todayApp
        self.centerView = todayAppDetailsViewController.view
        self.startAnimation()
    }
    
    func renderMultipleTodayAppDetails() {
        todayMultipleDetailViewController.todayApp = self.todayApp
        todayMultipleDetailViewController.handleClick = { app in
            let detailViewController = AppDetailsViewController()
            detailViewController.title = app.nome
            detailViewController.appID = app.id
            detailViewController.app = app
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
        self.centerView = todayMultipleDetailViewController.view
        self.startAnimation()
    }
    
    func startAnimation() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        self.renderCloseButton()
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heightConstraint?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.centerView?.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func closeAnimation() {
        self.todayMultipleDetailViewController.tableView.setContentOffset(CGPoint(x: 0, y: -self.todayMultipleDetailViewController.tableView.safeAreaInsets.top), animated: false)
        self.todayMultipleDetailViewController.tableView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x
                self.widthConstraint?.constant = frame.width
                self.heightConstraint?.constant = frame.height
                
                self.centerView?.layer.cornerRadius = 16
                self.todayAppDetailsViewController.tableView.contentOffset = .zero
                
                self.view.layoutIfNeeded()
            }
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc func handleCloseButtonAction() {
        self.closeButton.isHidden = true
        self.onClose?()
        self.closeAnimation()
    }
}
