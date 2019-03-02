//
//  ChannelDetailGoodsViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/30.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailGoodsViewController: UIViewController {

    @IBOutlet weak var tableView0: UITableView!
    @IBOutlet weak var tableViewsWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView0.delegate = self
        tableView0.dataSource = self
        tableViewsWidth.constant = self.view.frame.width
    }
    

}

extension ChannelDetailGoodsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView0.dequeueReusableCell(withIdentifier: "ChannelDetailItemsSquareTableViewCell", for: indexPath) as! ChannelDetailItemsSquareTableViewCell
        cell.setup()
        return cell
    }
    
    
}
