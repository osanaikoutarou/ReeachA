//
//  ChannelDetailWebsiteViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/01/27.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit
import WebKit

class ChannelDetailWebsiteViewController: UIViewController {

    @IBOutlet weak var wkWebView: WKWebView!
    let navTabScrollController = NavTabScrollController()
    
    var webLink:WebLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = webLink?.url {
            wkWebView.load(URLRequest(url: url))
        }
        wkWebView.scrollView.delegate = self
        
        navTabScrollController.didUp = {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        navTabScrollController.didDown = {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
        addAnyButtonsToRight(image1: UIImage(named: "icon_safari"), image2: UIImage(named: "icon_bookmark"), action1: {
            if let url = self.webLink?.url {
                UIApplication.shared.open(url, options: [:], completionHandler: { (finished) in
                })
            }
        }, action2: {
            print("bookmark")
        })
    }
    

}

extension ChannelDetailWebsiteViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navTabScrollController.scrollViewdidScroll(scrollView: scrollView)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        navTabScrollController.startScrolling(offset: scrollView.contentOffset)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        navTabScrollController.endScrolling()
    }
}
