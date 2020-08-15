//
//  ViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/25.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 10
        var j = 20
        String(format: "あいうえお%d %d", i, j)
        String(format: "あいうえお10 20")
        
        let d = Date() + 24*60*60
        
        "(date >= \(Date()) AND (date <= \(Date())"
    }
}

