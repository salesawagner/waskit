//
//  NSDate+WASFormats.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//*************************
// MARK: Formats
//*************************

extension NSDate {

	/**
	- returns: string "HH:mm"
	*/
	public var time: String {
		return String(format: "%d:%d", self.WAShour, self.WASminute)
	}
	
	/**
	Return a date string formated by template.
	
	- parameter template: Template to formatter the date. By default "dd-MM-yyyy HH:mm".
	- parameter locale:   Locale to format date.
	
	- returns: Date string formatted. Ex. default: 08/10/1984 16:00
	*/
	public func WAStoLongString(template: String = "dd/MM/yyyy HH:mm", locale: NSLocale = NSLocale.currentLocale()) -> String {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate(template, options: 0, locale: locale)
		dateFormatter.locale = locale
		return dateFormatter.stringFromDate(self)
	}
	
	/**
	Return a date string formated by template.
	
	- parameter template: Template to formatter the date. By default "dd/MM/yyyy".
	- parameter locale:   Locale to format date.
	
	- returns: Date string formatted. Ex. default: 08/10/1984
	*/
	public func WAStoString(template: String = "dd/MM/yyyy", locale: NSLocale = NSLocale.currentLocale()) -> String {
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate(template, options: 0, locale: locale)
		dateFormatter.locale = locale
		return dateFormatter.stringFromDate(self)
	}
	
}
