//
//  ChannelCategory.swift
//  ReeachA
//
//  Created by osanai on 2019/02/04.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

enum ChannelCategoryType {
    case other
    case anime
    case comic
    case webComic
    case music
    case video
    case event
    case caractor
    case human
    case organization
    // information
}

class ChannelCategory: InfoAtom {
    var channelCategoryType:ChannelCategoryType = .other    
}
