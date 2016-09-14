//
//  NSDate+WASComponents.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**********************************************************************************************************
//
// MARK: - Constants -
//
//**********************************************************************************************************

let kComponentFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekdayOrdinal, .WeekOfYear]

//*************************
// MARK: Components
//*************************

extension NSDate {

	/**
	- Date components.
	*/
	public var WASdateComponents: NSDateComponents {
		return NSCalendar.currentCalendar().components(kComponentFlags, fromDate: self)
	}
	
	/**
	- Date second.
	*/
	public var WASsecond: Int {
		return self.WASdateComponents.second
	}
	
	/**
	- Date minute.
	*/
	public var WASminute: Int {
		return self.WASdateComponents.minute
	}
	
	/**
	- Date hour.
	*/
	public var WAShour: Int {
		return self.WASdateComponents.hour
	}
	
	/**
	- Date day.
	*/
	public var WASday: Int {
		return self.WASdateComponents.day
	}
	
	/**
	- Date month.
	*/
	public var WASmonth: Int {
		return self.WASdateComponents.month
	}
	
	/**
	- Date year.
	*/
	public var WASyear: Int {
		return self.WASdateComponents.year
	}
	
}
