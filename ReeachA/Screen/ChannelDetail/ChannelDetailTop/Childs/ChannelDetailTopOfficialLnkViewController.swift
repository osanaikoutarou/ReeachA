//
//  ChannelDetailTopOfficialLnkViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/09/09.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopOfficialLnkViewController: UIViewController {

    @IBOutlet weak var officialLinkDynamicStackView: DynamicStackView!

    var channel: Channel? {
        didSet {
            setup()
        }
    }

    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup() {

        // 最初の3つのみ
        (channel as? Anime)?.officialWebLinks.prefix(3).forEach { link in
            let cell = LinkVerticalDynamicStackViewCell(webLink: link)
            cell.automaticDimension = false
            cell.height = 44
            cell.isIconHidden = true
            cell.padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 10)
            officialLinkDynamicStackView.addCell(cell: cell)
        }

    }
}
