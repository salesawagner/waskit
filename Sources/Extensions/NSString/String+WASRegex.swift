//
//  String+WASRegex.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension String {

	/**
	Matche in string by regex parameter
	
	- parameter regexString: regex String
	
	- returns: String array of matches
	*/
	func WASmatchesForRegexInText(regexString: String) -> [String] {
		do {
			let regex = try NSRegularExpression(pattern: regexString, options: .CaseInsensitive)
			let nsString = self as NSString
			let range = NSMakeRange(0, nsString.length)
			let results = regex.matchesInString(self, options: .ReportCompletion, range: range)
			return results.map({
				nsString.substringWithRange($0.range)
			})
		} catch let e {
			print(e)
		}
		
		return [String]()
	}
	
}
