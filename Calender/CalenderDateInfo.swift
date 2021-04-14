//
//  CalenderDateInfo.swift
//  Calender
//
//  Created by 朱偉綸 on 2021/3/29.
//

import Foundation
import UIKit

class CalenderDateInfo {
    var currentYear:Int
    var currentMonth:Int
    var colorOfNormalCalender:UIColor
    var colorOfToday:UIColor
    
    
    var numberOfDaysInThisMonth:Int{
        let dateComponents = DateComponents(year: currentYear,month: currentMonth)
        guard let date = Calendar.current.date(from: dateComponents) else { return 0 }
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        return range?.count ?? 0
    }

    var howManyDaysShouldIAddFromFirstFrame:Int{
        let dateComponents = DateComponents(year: currentYear,month: currentMonth)
        guard let date = Calendar.current.date(from: dateComponents) else { return 0 }
        return Calendar.current.component(.weekday, from: date) - 1
    }
    
    var MonthOfLabel:String{
        return "\(currentYear) 年 \(changeDayForm(day: currentMonth)) 月"
    }
    
    
    init(currentYear:Int, currentMonth:Int, colorOfNormalCalender:UIColor, colorOfToday:UIColor){
        self.currentYear = currentYear
        self.currentMonth = currentMonth
        self.colorOfNormalCalender = colorOfNormalCalender
        self.colorOfToday = colorOfToday
        
        
    }
    
    func changeDayForm(day:Int) -> String{
        if day == 1 || day == 2 || day == 3 || day == 4 || day == 5 || day == 6 || day == 7 || day == 8 || day == 9{ return "0\(day)" }else{ return "\(day)" }
    }
    
    func backgroudColor(indexPathRow:Int) -> UIColor{
        let realNumber = indexPathRow + 1 - self.howManyDaysShouldIAddFromFirstFrame
        let Year = Calendar.current.component(.year, from: Date())
        let Month = Calendar.current.component(.month, from: Date())
        let Day = Calendar.current.component(.day, from: Date())
        let date = "\(Year)\(changeDayForm(day: Month))\(changeDayForm(day: Day))"
        
        if date == "\(currentYear)\(changeDayForm(day: currentMonth))\(changeDayForm(day: realNumber))"{
            return colorOfToday
        }else{
            return colorOfNormalCalender
        }
    }
    
    func textColor(indexPathRow:Int) -> UIColor{
        let ch = indexPathRow
        if ch == 0 || ch == 7 || ch == 14 || ch == 21 || ch == 28 || ch == 35 || ch == 6 || ch == 13 || ch == 20 || ch == 27 || ch == 34 || ch == 41{
            return UIColor.red
        }else{
            return UIColor.black
        }
    }
    
    func text(indexPathRow:Int) -> String{
        let realNumber = indexPathRow + 1 - self.howManyDaysShouldIAddFromFirstFrame
        if indexPathRow < self.howManyDaysShouldIAddFromFirstFrame || realNumber > self.numberOfDaysInThisMonth {
            return ""
        }else{
            return "\(realNumber)"
        }
    }
    
    func ifActive(indexPathRow:Int) -> Bool{
        let realNumber = indexPathRow + 1 - self.howManyDaysShouldIAddFromFirstFrame
        if indexPathRow < self.howManyDaysShouldIAddFromFirstFrame || realNumber > self.numberOfDaysInThisMonth{
            return false
        }else{
            return true
        }
    }
    
    
    
    
    
    
    
}
















