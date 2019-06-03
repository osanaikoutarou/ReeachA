//
//  CalendarDayTopViewController.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CalendarDayTopViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    var weekModels: [WeekModel] = []
    var todayIndex: Int {
        for (index, weekModel) in weekModels.enumerated() {
            if weekModel.isCurrentWeek {
                return index
            }
        }
        return 0
    }

    override func loadView() {
        super.loadView()
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        weekModels = WeekModel.create100year()

        heightConstraint.constant = CalendarDayTopWeekCollectionViewLayout.size.height
        self.view.window?.layoutIfNeeded()

//        collectionView.register(cellType: CalendarDayTopCollectionViewCell.self)
        collectionView.register(cellType: CalendarDayTopWeekCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast

        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: { finished in
            self.collectionView.setHorizontalPage(page: self.todayIndex)
        })
    }

}

extension CalendarDayTopViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CalendarDayTopWeekCollectionViewCell.self, for: indexPath)
//        let dayModel = DayModel(dayFrom1970: indexPath.item)
//        let dayModel = days()[indexPath.item]

        let weekModel = weekModels[indexPath.item]
        cell.setup(weekModel: weekModel)

//        cell.setup(day: dayModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CalendarDayTopWeekCollectionViewCell.size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

class CalendarDayTopWeekCollectionViewLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        return cellLeftTargetContentOffset2(proposedContentOffset: proposedContentOffset,
                                            velocity: velocity,
                                            leftInset: 0,
                                            rightInset: 0)
    }

    static var size: CGSize {
        return CalendarDayTopWeekCollectionViewCell.size
    }

    override func awakeFromNib() {
        itemSize = CalendarDayTopWeekCollectionViewCell.size
        sectionInset = .zero
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal

    }
}

private extension UICollectionView {
    var horizontalPage: Int {
        return Int(contentOffset.x / frame.width)
    }
    func setHorizontalPage(page: Int) {
        var c = contentOffset
        c.x = frame.width * CGFloat(page)
        contentOffset = c
    }
}

class SelectingDay: NSObject {
    static let shared = SelectingDay()

    var dayModel: DayModel? = nil
}
