//
//  DebugViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {
    
    @IBOutlet weak var hoge1: UIView!
    @IBOutlet weak var hogeS: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hogeS.addSubview(hoge1)

        hoge1.bindFrameToSuperviewBounds()
        
//        hogeS.leadingAnchor.constraint(equalTo: hoge1.leadingAnchor).isActive = true
//        hogeS.trailingAnchor.constraint(equalTo: hoge1.trailingAnchor).isActive = true
//        hogeS.topAnchor.constraint(equalTo: hoge1.topAnchor).isActive = true
//        hogeS.bottomAnchor.constraint(equalTo: hoge1.bottomAnchor).isActive = true
        
//        hogeS.leftAnchor.constraint(equalTo: hoge1.leftAnchor, constant: 0).isActive = true
//        hogeS.rightAnchor.constraint(equalTo: hoge1.rightAnchor, constant: 0).isActive = true
//        hogeS.topAnchor.constraint(equalTo: hoge1.topAnchor, constant: 0).isActive = true
//        hogeS.bottomAnchor.constraint(equalTo: hoge1.bottomAnchor, constant: 0).isActive = true
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
