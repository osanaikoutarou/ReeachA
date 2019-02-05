//
//  DebugViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/05.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {

    @IBOutlet weak var stackLabelView: StackLabelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pair = Pair()
        pair.id = "1"
        pair.title = "たいとる"
        pair.value = "ばりゅーー"
        
        stackLabelView.addPairLabelView(pair: pair)
        stackLabelView.addPairLabelView(pair: pair)
        stackLabelView.addPairLabelView(pair: pair)
        stackLabelView.addPairLabelView(pair: pair)
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
