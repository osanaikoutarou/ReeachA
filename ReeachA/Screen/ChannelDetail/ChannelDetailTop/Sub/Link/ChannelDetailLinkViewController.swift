//
//  ChannelDetailLinkViewController.swift
//  
//
//  Created by 長内幸太郎 on 2019/09/12.
//

import UIKit

class ChannelDetailLinkViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    var nextViewControllers: [String: UIViewController] = [:]
    var officialViewController: ChannelDetailLinkOfficialViewController? {
        return nextViewControllers[ChannelDetailLinkOfficialViewController.className] as? ChannelDetailLinkOfficialViewController
    }
    var otherController: ChannelDetailLinkOtherViewController? {
        return nextViewControllers[ChannelDetailLinkOtherViewController.className] as? ChannelDetailLinkOtherViewController
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        print("🤔ChannelDetailLinkViewController prepare \(segue.identifier!)")
        if let identifier = segue.identifier {
            nextViewControllers[identifier] = segue.destination
        }
    }

}
