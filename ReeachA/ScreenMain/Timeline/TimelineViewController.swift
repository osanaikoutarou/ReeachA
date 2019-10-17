//
//  TimelineViewController.swift
//  ReeachA
//
//  Created by osanai on 2019/10/17.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: ChannelDetailTimelineTableViewCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension TimelineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChannelDetailTimelineTableViewCell.self, for: indexPath)
//        cell.channel = channel
        return cell
    }
}
