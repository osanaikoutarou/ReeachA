//
//  LabelPair.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/11.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class LabelPair: NSObject {
    var id:String?
    var title:InfoAtom?
    var values:[InfoAtom] = []
    
    convenience init(id:String?, title:InfoAtom?, values:[InfoAtom]) {
        self.init()
        self.id = id
        self.title = title
        self.values = values
    }
    convenience init(id:String?, infoPair:InfoPair) {
        self.init()
        self.id = id
        self.title = infoPair.title
        self.values = infoPair.contents
    }
}
