//
//  Human.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/03.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

enum HumanType {
    case normal
}

class Human: Channel {
    var humanType:HumanType = .normal

    func setup(positionName:String, name:String) {
        self.name = name
        self.positionName = positionName
    }
    
}
