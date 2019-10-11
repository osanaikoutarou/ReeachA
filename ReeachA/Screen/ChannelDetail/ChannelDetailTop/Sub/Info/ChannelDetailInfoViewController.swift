//
//  ChannelDetailInfoViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/10/02.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailInfoViewController: UIViewController, HaveChannel, ChannelDetailTopChild {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: PairLabelTableViewCell.self)
        }
    }
    
//    // スライド
//    var summaryVC: ChannelDetailInfoSummaryViewController? {
//        return children.first(where: { $0 is ChannelDetailInfoSummaryViewController} ) as? ChannelDetailInfoSummaryViewController
//    }
//    var staffVC: ChannelDetailInfoStaffViewController? {
//        return children.first(where: { $0 is ChannelDetailInfoStaffViewController} ) as? ChannelDetailInfoStaffViewController
//    }
//    var castVC: ChannelDetailInfoCastViewController? {
//        return children.first(where: { $0 is ChannelDetailInfoCastViewController} ) as? ChannelDetailInfoCastViewController
//    }
//
//    var allChildren: [HaveChannel?] {
//        return [summaryVC, staffVC, castVC]
//    }

    enum SectionType {
        case summary
        case staff
        case cast
    }
    var sectionTypes: [SectionType] = [.summary, .staff, .cast]

    var channel: Channel? {
        didSet {
            setup()
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setup() {
//        allChildren.forEach { (vc) in
//            vc?.channel = self.channel
//        }
    }
    
}

extension ChannelDetailInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTypes.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sectionTypes[section]

        switch sectionType {
        case .summary:
            return (channel as? Anime)?.topInfos.count ?? 0
        case .staff:
            return (channel as? Anime)?.staffs.count ?? 0
        case .cast:
            return (channel as? Anime)?.casts.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PairLabelTableViewCell.self, for: indexPath)

        let sectionType = sectionTypes[indexPath.section]
        switch sectionType {
        case .summary:
            let infoPair = (channel as? Anime)!.topInfos[indexPath.row]
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            cell.setup(labelPair: labelPair)
            return cell
        case .staff:
            let infoPair = (channel as? Anime)!.staffs[indexPath.row]
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            cell.setup(labelPair: labelPair)
            return cell
        case .cast:
            let infoPair = (channel as? Anime)!.casts[indexPath.row]
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            cell.setup(labelPair: labelPair)
            return cell
        }
    }
}

extension ChannelDetailInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
