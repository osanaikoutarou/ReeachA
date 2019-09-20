//
//  ChannelDetailTimelineViewController.swift
//  ReeachA
//
//  Created by osanai on 2019/09/19.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTimelineViewController: UIViewController {

    var channel: Channel? {
        didSet {
            tableView.reloadData()
            // setup()
        }
    }

    enum CellType {
        case summary
    }

    let cellTypes: [CellType] = [.summary]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: ChannelDetailSummaryTableViewCell.self)
            tableView.contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ChannelDetailTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChannelDetailSummaryTableViewCell.self, for: indexPath)
        cell.channel = channel
        return cell
    }
}
