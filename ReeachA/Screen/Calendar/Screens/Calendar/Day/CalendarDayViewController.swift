//
//  CalendarDayViewController.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/29.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CalendarDayViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutIfNeeded()

//        let layout = collectionView.collectionViewLayout as! CalendarDayViewControllerLayout
//        layout.itemSize = collectionView.frame.size

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast

//        CalendarDayViewControllerLayout.size = CGSize(width: 350.0, height: collectionView.frame.height)

    }
}

extension CalendarDayViewController: UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CalendarDayScheduleCollectionViewCell.self, for: indexPath)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350.0, height: collectionView.frame.height)
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

    static var size: CGSize = CGSize(width: 350.0, height: 1)

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        return cellHorizontalCenterTargetContentOffset(proposedContentOffset: proposedContentOffset, velocity: velocity)
//        return cellLeftTargetContentOffset(proposedContentOffset: proposedContentOffset, velocity: velocity, leftInset: 0, rightInset: 0)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        itemSize = CGSize(width: 350.0, height: 1)
        sectionInset = .zero
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }

}
