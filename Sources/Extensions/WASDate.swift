//
//  WASDate.swift
//  WASKit
//
//  Created by Wagner Sales on 5/24/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**********************************************************************************************************
//
// MARK: - Constants -
//
//**********************************************************************************************************

let kComponentFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekdayOrdinal, .WeekOfYear]

extension NSDate {
	
	//*************************
	// MARK: Comparassion
	//*************************
	
	public func isGreaterThan(date: NSDate) -> Bool {

		var isGreater = false
		
		if self.compare(date) == NSComparisonResult.OrderedDescending {
			isGreater = true
		}
		
		return isGreater
	}
	
	public func isLessThan(date: NSDate) -> Bool {

		var isLess = false
		
		if self.compare(date) == NSComparisonResult.OrderedAscending {
			isLess = true
		}
		
		return isLess
	}
	
	public func equalTo(date: NSDate) -> Bool {

		var isEqualTo = false
		
		if self.compare(date) == NSComparisonResult.OrderedSame {
			isEqualTo = true
		}
		
		return isEqualTo
	}
	
	//*************************
	// MARK: Time manager
	//*************************
	
	public func addSeconds(value: Int) -> NSDate {
		return self.future(value, calendarUnit: NSCalendarUnit.Second)
	}
	
	public func addMinutes(value: Int) -> NSDate {
		return self.future(value, calendarUnit: NSCalendarUnit.Minute)
	}
	
	public func future(value: Int, calendarUnit: NSCalendarUnit) -> NSDate {
		let components: NSDateComponents = NSDateComponents()
		components.setValue(value, forComponent: calendarUnit);
		return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue: 0))!
	}
	
	//*************************
	// MARK: Format
	//*************************
	
	var components: NSDateComponents {
		return NSCalendar.currentCalendar().components(kComponentFlags, fromDate: self)
	}
	
	func componentsFrom(date: NSDate) -> NSDateComponents {
		let current = NSCalendar.currentCalendar()
		return current.components(kComponentFlags, fromDate: date, toDate: self, options: [])
	}
	
	/**
	Return a date formated
	
	- parameter style: Style to formmater the date. By default .ShortStyle
	
	- returns: Date string formatted. Ex. default: 6/28/16
	*/
	public func toString(style: NSDateFormatterStyle = .ShortStyle) -> String {
		let dateFormatter = NSDateFormatter()
		dateFormatter.locale = NSLocale.currentLocale()
		dateFormatter.dateStyle = style
		return dateFormatter.stringFromDate(self)
	}
	
	/**
	Return a date formated by template
	
	- parameter template: template to formmater the date. By default "dd-MM-yyyy HH:mm".currentLocale()
	
	- returns: Date string formatted. Ex. default: 08/10/1984 16:00
	*/
	public func toStringFormatted(template: String = "dd/MM/yyyy HH:mm") -> String {
		let locale = NSLocale.currentLocale()
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate(template, options: 0, locale: locale)
		dateFormatter.locale = locale
		return dateFormatter.stringFromDate(self)
	}
	
	/**
	- returns: Int date second.
	*/
	public var second: Int {
		return self.components.second
	}

	/**
	- returns: Int date minute.
	*/
	public var minute: Int {
		return self.components.minute
	}
	
	/**
	- returns: Int date hour.
	*/
	public var hour: Int {
		return self.components.hour
	}
	
	/**
	- returns: Int date day.
	*/
	public var day: Int {
		return self.components.day
	}
	
	/**
	- returns: Int date month.
	*/
	public var month: Int {
		return self.components.month
	}
	
	/**
	- returns: Int date year.
	*/
	public var year: Int {
		return self.components.year
	}
	
	/**
	- returns: "HH:mm"
	*/
	public var time: String {
		return String(format: "%d:%d", self.hour, self.minute)
	}
	
	/**
	- returns: string "dd/MM/yyyy"
	*/
	public var shortDate: String {
		return String(format: "%d/%d/%d", self.day, self.month, self.year)
	}
	
	/**
	- returns: string "dd/MM/yyyy HH:mm"
	*/
	public var shortDateTime: String {
		return String(format: "%d %d", self.shortDate, self.time)
	}
	
	/**
	- returns: string "Monday June 30, 2014 10:42:21am PST"
	*/
	public var longDateTime: String {
		let formatter = NSDateFormatter()
		formatter.locale = .currentLocale()
		formatter.dateStyle = .FullStyle
		formatter.timeStyle = .FullStyle
		return formatter.stringFromDate(self)
	}
	
	//*************************
	// MARK: Offset
	//*************************
	
	/**
	Return year(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Year(s) offset
	*/
	public func yearsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).year
	}
	
	/**
	Return month(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Month(s) offset
	*/
	public func monthsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).month
	}
	
	/**
	Return week(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Week(s) offset
	*/
	public func weeksFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).weekOfYear
	}
	
	/**
	Return day(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Day(s) offset
	*/
	public func daysFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).day
	}
	
	/**
	Return hour(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Hour(s) offset
	*/
	public func hoursFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).hour
	}
	
	/**
	Return minute(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Minute(s) offset
	*/
	public func minutesFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).minute
	}
	
	/**
	Return second(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Second(s) offset
	*/
	public func secondsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).second
	}
	
	public func offsetFrom(date:NSDate) -> String {
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
