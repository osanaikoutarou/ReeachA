//
//  ChannelDetailInfoViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/10/02.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailInfoViewController: UIViewController, HaveChannel, ChannelDetailTopChild {
    var viewDidAppeared: Bool = false

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: ChannelDetailSummaryTableViewCell.self)
            tableView.contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
        }
    }

    var channel: Channel? {
        didSet {
            if tableView != nil {
                tableView.reloadData()
            }
        }
    }
    
    enum CellType {
        case summary
    }
    
    let cellTypes: [CellType] = [.summary]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppeared = true
    }
    
}

extension ChannelDetailInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChannelDetailSummaryTableViewCell.self, for: indexPath)
        cell.channel = channel
        return cell
    }
}

extension ChannelDetailInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
