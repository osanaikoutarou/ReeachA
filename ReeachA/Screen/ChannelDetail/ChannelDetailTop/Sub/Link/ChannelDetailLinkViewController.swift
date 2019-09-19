//
//  ChannelDetailLinkViewController.swift
//  
//
//  Created by 長内幸太郎 on 2019/09/12.
//

import UIKit

class ChannelDetailLinkViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    // embed parts(child)
    var embedViewControllers: [String: UIViewController] = [:]
    var officialViewController: ChannelDetailLinkOfficialViewController? {
        return embedViewControllers[ChannelDetailLinkOfficialViewController.className] as? ChannelDetailLinkOfficialViewController
    }
    var otherController: ChannelDetailLinkOtherViewController? {
        return embedViewControllers[ChannelDetailLinkOtherViewController.className] as? ChannelDetailLinkOtherViewController
    }
    // embed(parent)
    var parentChannelDetailTopViewController: ChannelDetailTopViewController? {
        return view.superview?.viewController as? ChannelDetailTopViewController
    }

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        print("🤔ChannelDetailLinkViewController prepare \(segue.identifier!)")
        if let identifier = segue.identifier {
            embedViewControllers[identifier] = segue.destination
        }
    }

}

extension ChannelDetailLinkViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        parentChannelDetailTopViewController?.scrollViewDidScroll(viewController: self, scrollView: scrollView)
    }
}



//めも



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        children.forEach { (viewController) in
            print(viewController.getIdentifier())
        }
    }

    @IBAction func tapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

protocol Identifier {
    var identifier: String { get }
}

extension NSObject {
    func getIdentifier() -> String {
        return (self as? Identifier)?.identifier ?? "_"
    }
}

extension ViewController: Identifier {
    var identifier: String {
        return "😀"
    }
}

extension UIViewController {
    func castToSelf(obj: Any) -> Self? {
        if obj is Self {
            return obj as! Self
        }
    }
}
