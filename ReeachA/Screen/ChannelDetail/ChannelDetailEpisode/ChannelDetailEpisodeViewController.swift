//
//  ChannelDetailEpisodeViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/02/02.
//  Copyright © 2019年 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailEpisodeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset = UIEdgeInsets(top: 400, left: 0, bottom: 0, right: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var openCell:[IndexPath:Bool] = [:]

    func isOpen(indexPath: IndexPath) -> Bool {
        if let isOpen = openCell[indexPath] {
            return isOpen
        }
        return false
    }
    func toggleOpen(indexPath: IndexPath) -> Bool {
        let current = isOpen(indexPath: indexPath)
        let result = !current
        openCell[indexPath] = result
        return result
    }
}

extension ChannelDetailEpisodeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isOpen(indexPath: indexPath) {
            return 280.0
        }
        else {
            return 120.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelDetailEpisodeTableViewCell", for: indexPath) as! ChannelDetailEpisodeTableViewCell
        cell.selectionStyle = .none
        
        cell.setup(tappedOfficialWebsiteAction: {
            self.performSegue(withIdentifier: "ChannelDetailWebsite", sender: nil)
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = toggleOpen(indexPath: indexPath)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}

extension ChannelDetailEpisodeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChannelDetailWebsite" {
            let vc = segue.destination as! ChannelDetailWebsiteViewController
            let webLink = WebLink(urlStr: "http://watatentv.com/story05.html", title: "第5話「いいから私にまかせなさい！」", icon: nil)
            vc.webLink = webLink
        }
    }
}
