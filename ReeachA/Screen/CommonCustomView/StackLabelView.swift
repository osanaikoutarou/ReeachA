//
//  StackLabelView.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class Pair {
    var id:String = ""
    var title:String = ""
    var value:String = ""
}

class StackLabelView: UIStackView {
    var pairs:[Pair] = []
    
    func addPairLabelView(pair:Pair) {
        pairs.append(pair)
        let newView = PairLabelView(frame: CGRect.px)
        self.addArrangedSubview(newView)
    }
    
}
