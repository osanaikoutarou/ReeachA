//
//  ChannelDetailLinkViewController.swift
//  
//
//  Created by 長内幸太郎 on 2019/09/12.
//

import UIKit

class ChannelDetailLinkViewController: UIViewController, HaveChannel, ChannelDetailTopChild {
    
    @IBOutlet weak var stackView: UIStackView!

    // embed parts(child)
    var officialViewController: ChannelDetailLinkOfficialViewController? {
        return children.first(where: { $0 is ChannelDetailLinkOfficialViewController }) as? ChannelDetailLinkOfficialViewController
    }
    var otherController: ChannelDetailLinkOtherViewController? {
        return children.first(where: { $0 is ChannelDetailLinkOtherViewController }) as? ChannelDetailLinkOtherViewController
    }

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }

    var headerHeight: CGFloat = 0 {
        didSet {
            scrollView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        }
    }

    var channel: Channel? {
        didSet {
            setup()
        }
    }

    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤔ChannelDetailLinkViewController viewDidLoad")
        // Do any additional setup after loading the view.
    }

    func setup() {
        print("🤔ChannelDetailLinkViewController setup")
        officialViewController?.channel = channel
        otherController?.channel = channel
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        print("🤔ChannelDetailLinkViewController prepare \(segue.identifier!)")
//        if let identifier = segue.identifier {
//            embedViewControllers[identifier] = segue.destination
//        }
//    }

}

extension ChannelDetailLinkViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}
