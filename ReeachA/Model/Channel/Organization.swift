//
//  Organization.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/03.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

enum OrganizationType {
    case company
}

class Organization: Channel {
    var organizationType:OrganizationType?    
}

extension Organization {
    func setup(name:String, positionName:String) {
        self.name = name
        self.positionName = positionName
    }
}
