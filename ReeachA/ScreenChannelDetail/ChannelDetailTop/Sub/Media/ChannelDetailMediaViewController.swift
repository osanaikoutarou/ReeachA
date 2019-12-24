//
//  ChannelDetailMediaViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/10/02.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailMediaViewController: UIViewController, HaveChannel, ChannelDetailTopChild {

    @IBOutlet weak var tableView: UITableView!

    var channel: Channel? {
        didSet {
//            setup()
        }
    }

    var headerHeight: CGFloat = 0 {
        didSet {
            tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ChannelDetailMediaViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: YoutubeTableViewCell.self, for: indexPath)
        cell.setup()
        return cell
    }


}

extension ChannelDetailMediaViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
