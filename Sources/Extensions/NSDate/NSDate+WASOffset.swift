//
//  NSDate+WASOffset.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//*************************
// MARK: Offset
//*************************

extension NSDate {

	func componentsFrom(date: NSDate) -> NSDateComponents {
		let current = NSCalendar.currentCalendar()
		return current.components(kComponentFlags, fromDate: date, toDate: self, options: [])
	}
	
	/**
	Return second(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Second(s) offset
	*/
	public func WASsecondsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).second
	}
	
	/**
	Return minute(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Minute(s) offset
	*/
	public func WASminutesFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).minute
	}
	
	/**
	Return hour(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Hour(s) offset
	*/
	public func WAShoursFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).hour
	}
	
	/**
	Return day(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Day(s) offset
	*/
	public func WASdaysFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).day
	}
	
	/**
	Return week(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Week(s) offset
	*/
	public func WASweeksFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).weekOfYear
	}
	
	/**
	Return month(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Month(s) offset
	*/
	public func WASmonthsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).month
	}
	
	/**
	Return year(s) offset from date
	
	- parameter date: Date from be calculated.
	
	- returns: Int Year(s) offset
	*/
	public func WASyearsFrom(date:NSDate) -> Int {
		return self.componentsFrom(date).year
	}
	
	/**
	Human offset from date
	
	- parameter date: Date from be calculated
	
	- returns: Human string. ex 10w
	*/
	public func WASoffsetFrom(date:NSDate) -> String {
		var humanFormat = ""
		if WASyearsFrom(date)   > 0 { humanFormat = "\(WASyearsFrom(date))y"   }
		else if WASmonthsFrom(date)  > 0 { humanFormat = "\(WASmonthsFrom(date))M"  }
		else if WASweeksFrom(date)   > 0 { humanFormat = "\(WASweeksFrom(date))w"   }
		else if WASdaysFrom(date)    > 0 { humanFormat = "\(WASdaysFrom(date))d"    }
		else if WAShoursFrom(date)   > 0 { humanFormat = "\(WAShoursFrom(date))h"   }
		else if WASminutesFrom(date) > 0 { humanFormat = "\(WASminutesFrom(date))m" }
		else if WASsecondsFrom(date) > 0 { humanFormat = "\(WASsecondsFrom(date))s" }
		return humanFormat
	}
	
}
