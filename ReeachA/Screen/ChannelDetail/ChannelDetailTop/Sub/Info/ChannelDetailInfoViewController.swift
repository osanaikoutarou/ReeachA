//
//  ChannelDetailInfoViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/10/02.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailInfoViewController: UIViewController, HaveChannel, ChannelDetailTopChild {

    @IBOutlet weak var scrollView: UIScrollView!
    // スライド
    var summaryVC: ChannelDetailInfoSummaryViewController? {
        return children.first(where: { $0 is ChannelDetailInfoSummaryViewController} ) as? ChannelDetailInfoSummaryViewController
    }
    var staffVC: ChannelDetailInfoStaffViewController? {
        return children.first(where: { $0 is ChannelDetailInfoStaffViewController} ) as? ChannelDetailInfoStaffViewController
    }
    var castVC: ChannelDetailInfoCastViewController? {
        return children.first(where: { $0 is ChannelDetailInfoCastViewController} ) as? ChannelDetailInfoCastViewController
    }

    var allChildren: [HaveChannel?] {
        return [summaryVC, staffVC, castVC]
    }

    var channel: Channel? {
        didSet {
            setup()
        }
    }

    var headerHeight: CGFloat = 0 {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setup() {
        allChildren.forEach { (vc) in
            vc?.channel = self.channel
        }
    }
    
}

extension ChannelDetailInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
