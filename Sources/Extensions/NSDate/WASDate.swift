//
//  WASDate.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension Date {

	/**
	Convenience init date with Int values.
	
	- parameter year:  Year Int.
	- parameter month: Month Int.
	- parameter day:   Day Int.
	
	- returns: NSDate
	*/
	public init(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
		if let date = Date.WAScreate(year: year, month: month, day: day, hour: hour, minute: minute, second: second) {
			self.init(timeInterval: 0, since: date)
			return
		}
		self.init()
	}
	
	/**
	Create date with Int values.
	
	- parameter year:  Year Int.
	- parameter month: Month Int.
	- parameter day:   Day Int.
	
	- returns: NSDate
	*/
	public static func WAScreate(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date? {
		var date: Date?
		var components		= DateComponents()
		components.year		= year
		components.month	= month
		components.day		= day
		components.hour		= hour
		components.minute	= minute
		components.second	= second
		if let calendar = NSCalendar(identifier: .gregorian) {
			date = calendar.date(from: components)
			
		}
		return date
	}
	
}
