//
//  ChannelDetailTopViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        descriptionTextView.removePadding()
//        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        self.navigationController?.isNavigationBarHidden = true
//        addHogeButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func addHogeButton() {
        let button = UIButton.init(type: .system)
        button.setTitle("hoge", for: .normal)
        button.addAction(for: .touchUpInside) {
//            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
//            self .show(vc!, sender: nil)
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
}

