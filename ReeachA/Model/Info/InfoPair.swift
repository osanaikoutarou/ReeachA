//
//  InfoAtom.swift
//  ReeachA
//
//  Created by osanai on 2019/02/04.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class InfoPair: NSObject {
    var title:InfoAtom = InfoAtom.empty
    var contents:[InfoAtom] = []
}

extension InfoPair {
    convenience init(title:InfoAtom, contents:[InfoAtom]) {
        self.init()
        self.setup(title: title, contents: contents)
    }
    func setup(title:InfoAtom, contents:[InfoAtom]) {
        self.title = title
        self.contents = contents
    }
}
