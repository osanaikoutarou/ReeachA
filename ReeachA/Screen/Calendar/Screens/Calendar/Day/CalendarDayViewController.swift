//
//  CalendarDayViewController.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/29.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit
import SwiftDate

class CalendarDayViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!

    var dayModels:[DayModel] = []
    let cellNumUnit: Int = 2000
    var startDate: Date = Date()
    var startIndex: Int = 1000

    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }

    func configure(startDate: Date) {
        self.startDate = startDate

        // clear
        dayModels = []
        // 前と後に配置
        for i in 0..<cellNumUnit {
            let j = i - cellNumUnit/2
            let day = startDate + j.days
            dayModels.append(DayModel(date: day))
        }

        collectionView.performBatchUpdates({
            self.collectionView.reloadData()
        }) { (finished) in
            self.collectionView.scrollToItem(at: IndexPath(item: self.startIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if dayModels.count == 0 {
            configure(startDate: Date())
        }

        self.view.layoutIfNeeded()

//        let layout = collectionView.collectionViewLayout as! CalendarDayViewControllerLayout
//        layout.itemSize = collectionView.frame.size

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast

        stackViewBottomConstraint.constant = self.tabBarController?.tabBar.frame.height ?? 0

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        stackViewBottomConstraint.constant = self.tabBarController?.tabBar.frame.height ?? 0
        view.layoutIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension CalendarDayViewController: UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dayModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let dayModel = dayModels[indexPath.item]

        let cell = collectionView.dequeueReusableCell(with: CalendarDayScheduleCollectionViewCell.self, for: indexPath)

        cell.setup(dayModel: dayModel)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.appWidth * 0.9, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

class CalendarDayViewControllerLayout: UICollectionViewFlowLayout {

    static var size: CGSize = CGSize(width: UIScreen.appWidth * 0.9, height: 1)

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        return cellHorizontalCenterTargetContentOffset(proposedContentOffset: proposedContentOffset, velocity: velocity)
//        return cellLeftTargetContentOffset(proposedContentOffset: proposedContentOffset, velocity: velocity, leftInset: 0, rightInset: 0)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        itemSize = CGSize(width: UIScreen.appWidth * 0.9, height: 1)
        sectionInset = .zero
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }

}
