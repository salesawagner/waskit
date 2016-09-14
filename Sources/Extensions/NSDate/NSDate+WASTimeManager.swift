//
//  NSDate+TimeManager.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//*************************
// MARK: Time manager
//*************************

extension NSDate {
	
	/**
	Add second(s) to date.
	
	- parameter value: second(s)[Int] to add.
	
	- returns: Date with seconds added.
	*/
	public func WASaddSeconds(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Second)
	}

	/**
	Add minute(s) to date.
	
	- parameter value: minute(s)[Int] to add.
	
	- returns: Date with minute added.
	*/
	public func WASaddMinutes(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Minute)
	}
	
	/**
	Add hour(s) to date.
	
	- parameter value: hour(s)[Int] to add.
	
	- returns: Date with hour added.
	*/
	public func WASaddHours(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Hour)
	}
	
	/**
	Add day(s) to date.
	
	- parameter value: day(s)[Int] to add.
	
	- returns: Date with day added.
	*/
	public func WASaddDays(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Day)
	}
	
	/**
	Add month(s) to date.
	
	- parameter value: month(s)[Int] to add.
	
	- returns: Date with month added.
	*/
	public func WASaddMonths(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Month)
	}
	
	/**
	Add year(s) to date.
	
	- parameter value: year(s)[Int] to add.
	
	- returns: Date with year added.
	*/
	public func WASaddYears(value: Int) -> NSDate {
		return self.WASfuture(value, unit: .Year)
	}
	
	/**
	Add unit to date
	
	- parameter value: Int to add.
	- parameter unit:  Unit to add.
	
	- returns: Date with unit added.
	*/
	public func WASfuture(value: Int, unit: NSCalendarUnit) -> NSDate {
		let components: NSDateComponents = NSDateComponents()
		components.setValue(value, forComponent: unit);
		return NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: self, options: NSCalendarOptions(rawValue: 0))!
	}
	
}
