//
//  ChannelDetailTopInfoTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/10.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dynamicStackView: DynamicStackView!
    @IBOutlet weak var header: DynamicVerticalStackViewHeader!
    @IBOutlet weak var titleLabel: UILabel!
    
    var needRefresh: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title:String, infos:[InfoPair]) {
        if !needRefresh {
            return
        }
        
        titleLabel.text = title
        
        infos.forEach {
            let pairCell = PairLabelDynamicStackViewCell(pair: LabelPair(id: nil, infoPair: $0))
            pairCell.automaticDimension = true
            pairCell.setFontSize(size: 12.f)
            pairCell.setTitleWidth(width: 120.f)
            dynamicStackView.addCell(cell: pairCell)
            dynamicStackView.spacing = 10.f
        }
        
        needRefresh = false
    }

}
