//
//  Anime.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/26.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class Anime: Channel {

    override init() {
        super.init()
        self.type = .anime
    }
    
    var topInfos:[Channel] = []
    var staffs:[Channel] = []
    var casts:[Channel] = []
}
