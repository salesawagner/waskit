//
//  NSDate+WASComparation.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//*************************
// MARK: Comparassion
//*************************

extension NSDate {
	
	/**
	Compare if date is Greater than date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if greater, false if less.
	*/
	public func WASisGreaterThan(date: NSDate) -> Bool {
		return self.compare(date) == .OrderedDescending
	}
	
	/**
	Compare if date is Less than date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if less, false if greater.
	*/
	public func WASisLessThan(date: NSDate) -> Bool {
		return self.compare(date) == .OrderedAscending
	}
	
	/**
	Compare if date is Equal to date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if equal, false if no equal.
	*/
	public func WASisEqualTo(date: NSDate) -> Bool {
		return self.compare(date) == .OrderedSame
	}

}
