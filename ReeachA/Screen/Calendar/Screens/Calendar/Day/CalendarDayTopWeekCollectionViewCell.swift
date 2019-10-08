//
//  CalendarDayTopWeekCollectionViewCell.swift
//  WeekCalendarExample
//
//  Created by 長内幸太郎 on 2019/06/02.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class CalendarDayTopWeekCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    @IBOutlet var monthLabels: [UILabel]!
    @IBOutlet var dayLabels: [UILabel]!

    @IBOutlet weak var toDayView: UIView!
    @IBOutlet weak var selectingView: UIView!

    static var size = CGSize(width: ceil(UIScreen.main.bounds.width), height: 105)

    var weekModel: WeekModel?

    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    func setup(weekModel: WeekModel) {
        self.weekModel = weekModel

        weekModel.days.indices.forEach { (index) in
            let dayModel = weekModel.days[index]
            monthLabels[index].text = ""
            dayLabels[index].text = dayModel.date.dayString
        }
        let firstDayModel = weekModel.days.first!
        let lastDayModel = weekModel.days.last!

        yearMonthLabel.text = lastDayModel.date.yearString + "年" + lastDayModel.date.monthString + "月"
        if firstDayModel.date.month == lastDayModel.date.month {
            leftMarginConstraint.constant = 10
        }
        else {
            let index = weekModel.days.firstIndex(where: { $0.date.day == 1})!
            leftMarginConstraint.constant = CGFloat(index)/7.0 * frame.width + 10
        }

        setCircleViews()
    }

    func setCircleViews() {
        guard let weekModel = weekModel else {
            return
        }

        dayLabels.forEach { $0.textColor = .black }

        toDayView.isHidden = true
        for (index, dayModel) in weekModel.days.enumerated() {
            if dayModel.date.isToday {
                toDayView.transform = CGAffineTransform(translationX: CGFloat(index)/7.0 * frame.width, y: 0)
                toDayView.isHidden = false
                dayLabels[index].textColor = .white
            }
        }

        let animation: Bool = !selectingView.isHidden
        selectingView.isHidden = true
        if let selectDay = SelectingDay.shared.dayModel {
            for (index, dayModel) in weekModel.days.enumerated() {
                if dayModel.date.day == selectDay.date.day {
                    selectingView.isHidden = false

                    if animation {
                        UIView.animate(withDuration: 0.3, animations: {
                            self.selectingView.transform = CGAffineTransform(translationX: CGFloat(index)/7.0 * self.frame.width, y: 0)
                        }) { (finished) in
                            self.dayLabels[index].textColor = .white
                        }
                    }
                    else {
                        self.selectingView.transform = CGAffineTransform(translationX: CGFloat(index)/7.0 * self.frame.width, y: 0)
                        self.dayLabels[index].textColor = .white
                    }

                }
            }
        }
    }

    @IBAction func tappedDay(_ sender: ButtonView) {
        guard let weekModel = weekModel else {
            return
        }

        SelectingDay.shared.dayModel = weekModel.days[sender.tag]
        setCircleViews()
    }


}
