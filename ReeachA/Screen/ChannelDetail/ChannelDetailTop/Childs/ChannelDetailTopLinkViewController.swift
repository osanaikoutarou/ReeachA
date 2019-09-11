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

        (channel as? Anime)?.webLinks.forEach { link in
            let cell = LinkVerticalDynamicStackViewCell(webLink: link)
            cell.automaticDimension = false
            cell.height = 44
            cell.isIconHidden = true
            cell.padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 10)
            linkDynamicStackView.addCell(cell: cell)
        }

    }


}
