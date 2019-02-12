//
//  ChannelDetailTopLinkTableViewCell.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/12.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopLinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var officialDynamicStackView: DynamicStackView!
    @IBOutlet weak var webLinkDynamicStackView: DynamicStackView!
    var needRefresh: Bool = true
    
    func setup(anime: Anime) {
        if !needRefresh {
            return
        }
        
        anime.officialWebLinks.forEach { link in
            let cell = LinkVerticalDynamicStackViewCell(webLink: link)
            cell.automaticDimension = true
            officialDynamicStackView.addCell(cell: cell)
        }
        
        anime.webLinks.forEach { link in
            let cell = LinkVerticalDynamicStackViewCell(webLink: link)
            cell.automaticDimension = true
            webLinkDynamicStackView.addCell(cell: cell)
        }
        
        needRefresh = false
    }

}
