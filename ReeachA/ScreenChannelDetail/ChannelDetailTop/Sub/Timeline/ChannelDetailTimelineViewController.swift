//
//  ChannelDetailTimelineViewController.swift
//  ReeachA
//
//  Created by osanai on 2019/09/19.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTimelineViewController: UIViewController, HaveChannel, ChannelDetailTopChild {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: ChannelDetailTimelineTableViewCell.self)
            tableView.contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
        }
    }

    var channel: Channel? {
        didSet {
            tableView.reloadData()
            // setup()
        }
    }

    var headerHeight: CGFloat = 0 {
        didSet {
            tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        }
    }

    enum CellType {
        case summary
    }

//    let cellTypes: [CellType] = [.summary]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ChannelDetailTimelineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChannelDetailTimelineTableViewCell.self, for: indexPath)
//        cell.channel = channel
        return cell
    }
}

extension ChannelDetailTimelineViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
