//
//  ChannelDetailTopLinkViewController.swift
//  ReeachA
//
//  Created by osanai on 2019/09/10.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopLinkViewController: UIViewController {

    @IBOutlet weak var linkDynamicStackView: DynamicStackView!

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
        (channel as? Anime)?.webLinks.forEach { link in
            let cell = LinkVerticalDynamicStackViewCell(webLink: link)
            cell.automaticDimension = false
            cell.height = 44
            cell.isIconHidden = true
            linkDynamicStackView.addCell(cell: cell)
        }

    }


}
