//
//  ChannelDetailInfoCastViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/10/06.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailInfoCastViewController: UIViewController, HaveChannel {

    @IBOutlet weak var stackView: DynamicStackView!

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
    }

    func setup() {
        (channel as? Anime)?.casts.forEach({ (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelDynamicStackViewCell(pair: labelPair)

            cell.automaticDimension = true
            cell.setFont(font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular))
            cell.setTitleWidth(width: 150.f)
            cell.setTextColor(color: .black)
            cell.isSeparatorHidden = false
            stackView.addCell(cell: cell)
        })
        stackView.spacing = 8.f
    }

}
