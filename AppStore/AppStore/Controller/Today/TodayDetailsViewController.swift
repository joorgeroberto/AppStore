//
//  TodayDetailsViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 07/12/21.
//

import Foundation
import UIKit

class TodayDetailsViewController: UIViewController {
    var centerView: UIView?
    var frame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        centerView = UIView()
    }
    
    func startAnimation() {
        guard let centerView = self.centerView, let frame = self.frame else { return }
        centerView.backgroundColor = .blue
        centerView.frame = frame
        
        view.addSubview(centerView)
    }
}
