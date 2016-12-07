//
//  WASArray.swift
//  WASKit
//
//  Created by Wagner Sales on 25/10/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension Array where Element: Hashable {
	/**
	Remove duplicate elements from an array.
	
	- returns: A new array without duplicates.
	*/
	public func WASRemoveDuplicates() -> [Element] {
		var result: [Element] = []
		for value in self {
			if !result.contains(value) {
				result.append(value)
			}
		}
		return result
	}
	
	/**
	Remove duplicate elements from an array.
	*/
	public mutating func WASRemoveDuplicatesInPlace() {
		var result: [Element] = []
		for value in self {
			if !result.contains(value) {
				result.append(value)
			}
		}
		self = result
	}
	
	/**
	Transform array to string.
	
	- parameter separator: String to separate array objects.
	
	- returns: String with array's objects.
	*/
	public func WASToString(separator: String? = nil) -> String {
		var filter = ""
		for element in self {
			if filter.isEmpty {
				filter = "\(element)"
			} else {
				filter += separator ?? "" + "\(element)"
			}
		}
		return filter
	}
	
	/**
	Print each array's objects.
	*/
	public func WASPrint() {
		for element in self {
			print(element)
		}
	}
}
