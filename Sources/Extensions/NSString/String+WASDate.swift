//
//  NSString+WASDate.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension String {

	/**
	Return NSDate with format
	
	- parameter format: Date string format. By default yyyy-MM-dd'T'HH:mm:ss.SSSZ
	
	- returns: NSDate.
	*/
	public func WAStoDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> NSDate? {
		var dateFormatted: NSDate?
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = format
		if let date = dateFormatter.dateFromString(self) {
			dateFormatted = date
		}
		return dateFormatted
	}
	
}
