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

extension Date {
	
	/**
	Compare if date is Greater than date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if greater, false if less.
	*/
	public func WASisGreaterThan(_ date: Date) -> Bool {
		return self.compare(date) == .orderedDescending
	}
	
	/**
	Compare if date is Less than date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if less, false if greater.
	*/
	public func WASisLessThan(_ date: Date) -> Bool {
		return self.compare(date) == .orderedAscending
	}
	
	/**
	Compare if date is Equal to date parameter.
	
	- parameter date: Date to be compared.
	
	- returns: true if equal, false if no equal.
	*/
	public func WASisEqualTo(_ date: Date) -> Bool {
		return self.compare(date) == .orderedSame
	}

}
