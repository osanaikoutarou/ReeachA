//
//  ChannelDetailTabBarController.swift
//  ReeachA
//
//  Created by osanai on 2019/02/04.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTabBarController: UITabBarController {
    
    var channel: Channel! = Channel.sample

    override func viewDidLoad() {
        super.viewDidLoad()
        title = channel.title
    }

}
