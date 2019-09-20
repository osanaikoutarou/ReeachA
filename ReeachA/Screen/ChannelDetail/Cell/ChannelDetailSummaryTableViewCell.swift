//
//  ChannelDetailSummaryTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/09/20.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var summaryInfoStackView: DynamicStackView!

    var channel: Channel? {
        didSet {
            setup()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup() {
        (channel as? Anime)?.topInfos.forEach({ (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelDynamicStackViewCell(pair: labelPair)

            cell.automaticDimension = true
            cell.setFont(font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular))
            cell.setTitleWidth(width: 150.f)
            cell.setTextColor(color: .black)
            cell.isSeparatorHidden = false
            summaryInfoStackView.addCell(cell: cell)
        })
        summaryInfoStackView.spacing = 5.f
    }

}
