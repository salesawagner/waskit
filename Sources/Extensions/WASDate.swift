//
//  WASDate.swift
//  WASKit
//
//  Created by Wagner Sales on 5/24/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension NSDate {
	
	//*************************
	// MARK: Comparassion
	//*************************
	
	func isGreaterThan(date: NSDate) -> Bool {

		var isGreater = false
		
		if self.compare(date) == NSComparisonResult.OrderedDescending {
			isGreater = true
		}
		
		return isGreater
	}
	
	func isLessThan(date: NSDate) -> Bool {

		var isLess = false
		
		if self.compare(date) == NSComparisonResult.OrderedAscending {
			isLess = true
		}
		
		return isLess
	}
	
	func equalTo(date: NSDate) -> Bool {

		var isEqualTo = false
		
		if self.compare(date) == NSComparisonResult.OrderedSame {
			isEqualTo = true
		}
		
		return isEqualTo
	}
	
	//*************************
	// MARK: Time manager
	//*************************
	
	func addSeconds(value: Int) -> NSDate {
		return self.future(value, calendarUnit: NSCalendarUnit.Second)
	}
	
	func addMinutes(value: Int) -> NSDate {
		return self.future(value, calendarUnit: NSCalendarUnit.Minute)
	}
	
	func future(value: Int, calendarUnit: NSCalendarUnit) -> NSDate {
		let components: NSDateComponents = NSDateComponents()
		components.setValue(value, forComponent: calendarUnit);
		return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue: 0))!
	}
	
	//*************************
	// MARK: Format
	//*************************
	
	struct Formatter {
		static let shortDate = NSDateFormatter(dateFormat: "dd-MM-yyyy")
		static let shortDateTime = NSDateFormatter(dateFormat: "dd-MM-yyyy HH:mm")
		static let longDateTime = NSDateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
	}
	
	var shortDate: String {
		return Formatter.shortDate.stringFromDate(self)
	}
	
	var shortDateTime: String {
		return Formatter.shortDateTime.stringFromDate(self)
	}
	
	var longDateTime: String {
		return Formatter.longDateTime.stringFromDate(self)
	}
	
	func toString(style: NSDateFormatterStyle = .MediumStyle) -> String {
		let dateFormatter = NSDateFormatter()
		dateFormatter.locale = NSLocale.currentLocale()
		dateFormatter.dateStyle = style
		return dateFormatter.stringFromDate(self)
	}
	
	func yearsFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
	}
	
	func monthsFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
	}
	
	func weeksFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
	}
	
	func daysFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
	}
	
	func hoursFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
	}
	
	func minutesFrom(date:NSDate) -> Int{
		return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
	}
	
	func secondsFrom(date:NSDate) -> Int {
		return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
	}
	
	func offsetFrom(date:NSDate) -> String {
		if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
		if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
		if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
		if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
		if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
		if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
		if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
		return ""
	}
}

extension NSDateFormatter {
	convenience init(dateFormat: String) {
		self.init()
		self.dateFormat = dateFormat
	}
}
