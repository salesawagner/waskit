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

extension Date {

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
	public func WAStoLongString(_ template: String = "dd/MM/yyyy HH:mm", locale: Locale = Locale.current) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: locale)
		dateFormatter.locale = locale
		return dateFormatter.string(from: self)
	}
	
	/**
	Return a date string formated by template.
	
	- parameter template: Template to formatter the date. By default "dd/MM/yyyy".
	- parameter locale:   Locale to format date.
	
	- returns: Date string formatted. Ex. default: 08/10/1984
	*/
	public func WAStoString(_ template: String = "dd/MM/yyyy", locale: Locale = Locale.current) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: locale)
		dateFormatter.locale = locale
		return dateFormatter.string(from: self)
	}
	
}
