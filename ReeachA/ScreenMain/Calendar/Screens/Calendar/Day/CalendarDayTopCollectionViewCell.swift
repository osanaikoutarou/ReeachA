//
//  CalendarDayTopCollectionViewCell.swift
//  WeekCalendarExample
//
//  Created by osanai on 2019/05/30.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit
import SwiftDate

class CalendarDayTopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!

    static var size = CGSize(width: ceil(UIScreen.main.bounds.width/7.0), height: 115)

    func setup(date: Date) {
        monthLabel.text = date.monthString
        dayLabel.text = date.dayString
        dayOfTheWeekLabel.text = date.weekDayString
    }

    func setup(day: DayModel) {
        if day.date.day == 1 {
            monthLabel.text = day.date.yearString + "年" + day.date.monthString
        }
        else if day.date.day == 2 {
            monthLabel.text = "月"
        }
        else {
            monthLabel.text = ""
        }
        print(day.date.monthString)
        dayLabel.text = day.date.dayString
        dayOfTheWeekLabel.text = day.date.weekDayString1Chara
        if day.date.weekDayString1Chara == "日" {
            dayOfTheWeekLabel.textColor = .red
        }
        else if day.date.weekDayString1Chara == "土" {
            dayOfTheWeekLabel.textColor = .blue
        }
        else {
            dayOfTheWeekLabel.textColor = .black
        }
    }

}




extension DateFormatter {
    // テンプレートの定義(例)
    enum Template: String {
        case date = "yMd"     // 2017/1/1
        case time = "Hms"     // 12:39:22
        case full = "yMdkHms" // 2017/1/1 12:39:22
        case onlyHour = "k"   // 17時
        case era = "GG"       // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
        case weekDay = "EEEE" // 日曜日
        case month = "M"
        case day = "d"
    }

    func setTemplate(_ template: Template) {
        // optionsは拡張用の引数だが使用されていないため常に0
        dateFormat = DateFormatter.dateFormat(fromTemplate: template.rawValue, options: 0, locale: .current)
    }
}

extension Date {
    var yearString: String {
        return String(date.year)
    }
    var monthString: String {
//        let f = DateFormatter()
//        f.setTemplate(.month)
//        return f.string(from: self)
        return String(date.month)
    }

    var dayString: String {
        let f = DateFormatter()
        f.setTemplate(.day)
        return f.string(from: self)
    }

    var weekDayString: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "ja")
        f.setTemplate(.weekDay)
        return f.string(from: self)
    }

    var weekDayString1Chara: String {
        return String(weekDayString.prefix(1))
    }
}
