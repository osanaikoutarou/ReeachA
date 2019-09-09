//
//  ChannelDetailTopHeaderBaseInfoViewController.swift
//  ReeachA
//
//  Created by 長内幸太郎 on 2019/09/08.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ChannelDetailTopBaseInfoViewController: UIViewController {

    @IBOutlet weak var baseInfoStackView: DynamicStackView!
    @IBOutlet weak var summaryInfoStackView: DynamicStackView!

    @IBOutlet weak var stateButtonView: ButtonView!

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

        stateButtonView.ellipse(borderColor: UIColor.lightGray, borderWidth: 1)
    }

    func setup() {
        (channel as? Anime)?.baseInfos.forEach({ (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelDynamicStackViewCell(pair: labelPair)

            cell.automaticDimension = true
            cell.setFont(font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular))
            cell.setTitleWidth(width: 50.f)
            cell.height = 30.f
            cell.setTextColor(color: .black)
            cell.isSeparatorHidden = true
            baseInfoStackView.addCell(cell: cell)
        })
//        baseInfoStackView.layoutIfNeeded()

        (channel as? Anime)?.topInfos.forEach({ (infoPair) in
            let labelPair = LabelPair(id: nil, infoPair: infoPair)
            let cell = PairLabelDynamicStackViewCell(pair: labelPair)

            cell.automaticDimension = true
            cell.setFont(font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular))
            cell.setTitleWidth(width: 150.f)
            cell.setTextColor(color: .black)
            cell.isSeparatorHidden = false
            summaryInfoStackView.addCell(cell: cell)
        })
        summaryInfoStackView.spacing = 8.0.f
//        summaryInfoStackView.layoutIfNeeded()
    }

}

//class ChannelDetailTopHeaderBaseInfoViewControllerView: UIView {
//    var parentViewController: ChannelDetailTopHeaderBaseInfoViewController? {
//        if let viewController = viewController as? ChannelDetailTopHeaderBaseInfoViewController {
//            return viewController
//        }
//        return nil
//    }
//}
