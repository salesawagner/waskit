//
//  WASDate.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension NSDate {

	/**
	Create date with Int values.
	
	- parameter year:  Year Int.
	- parameter month: Month Int.
	- parameter day:   Day Int.
	
	- returns: NSDate
	*/
	public static func WAScreate(year year: Int, month: Int, day: Int) -> NSDate? {
		var dateFormatted: NSDate?
		let dateString = String(format:"%d/%d/%d", year, month, day)
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "yyyy/MM/dd"
		if let date = dateFormatter.dateFromString(dateString) {
			dateFormatted = date
		}
		return dateFormatted
	}
	
}
