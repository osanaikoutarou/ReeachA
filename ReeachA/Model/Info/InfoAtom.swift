//
//  InfoAtom.swift
//  ReeachA
//
//  Created by osanai on 2019/02/04.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

enum InfoAtomType {
    case normal
    case position
    case channelList
}

// 情報
class InfoAtom: NSObject {
    var id:String = ""
    var infoAtomType:InfoAtomType = .normal
    var name:String = ""
    var createdAt:Date?
}

extension InfoAtom {
    convenience init(name:String) {
        self.init()
        self.name = name
    }
    convenience init(name:String, infoAtomType:InfoAtomType) {
        self.init()
        self.infoAtomType = infoAtomType
        self.name = name
    }

    static var empty: InfoAtom {
        return InfoAtom(name: "")
    }
}
