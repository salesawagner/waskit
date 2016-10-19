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

extension Date {
	
	/**
	Add second(s) to date.
	
	- parameter value: second(s)[Int] to add.
	
	- returns: Date with seconds added.
	*/
	public func WASaddSeconds(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .second)
	}

	/**
	Add minute(s) to date.
	
	- parameter value: minute(s)[Int] to add.
	
	- returns: Date with minute added.
	*/
	public func WASaddMinutes(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .minute)
	}
	
	/**
	Add hour(s) to date.
	
	- parameter value: hour(s)[Int] to add.
	
	- returns: Date with hour added.
	*/
	public func WASaddHours(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .hour)
	}
	
	/**
	Add day(s) to date.
	
	- parameter value: day(s)[Int] to add.
	
	- returns: Date with day added.
	*/
	public func WASaddDays(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .day)
	}
	
	/**
	Add month(s) to date.
	
	- parameter value: month(s)[Int] to add.
	
	- returns: Date with month added.
	*/
	public func WASaddMonths(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .month)
	}
	
	/**
	Add year(s) to date.
	
	- parameter value: year(s)[Int] to add.
	
	- returns: Date with year added.
	*/
	public func WASaddYears(_ value: Int) -> Date {
		return self.WASfuture(value, unit: .year)
	}
	
	/**
	Add unit to date
	
	- parameter value: Int to add.
	- parameter unit:  Unit to add.
	
	- returns: Date with unit added.
	*/
	public func WASfuture(_ value: Int, unit: NSCalendar.Unit) -> Date {
		let components: DateComponents = DateComponents()
		(components as NSDateComponents).setValue(value, forComponent: unit);
		return (Calendar.current as NSCalendar).date(byAdding: components, to: self, options: NSCalendar.Options(rawValue: 0))!
	}
	
}
