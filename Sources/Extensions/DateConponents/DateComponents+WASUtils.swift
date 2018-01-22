//
//  WASKit
//
//  Copyright (c) Wagner Sales (http://wagnersales.com.br/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public extension DateComponents {
	
// MARK: - Public properties
	
	var WASfromNow: Date {
		let current = Calendar.current
		return current.date(byAdding: self, to: Date())!
	}

	var WASago: Date {
		let current = Calendar.current
		return current.date(byAdding: -self, to: Date())!
	}
	
// MARK: - Public static methods
	
	/// Creates inverse `DateComponents`
	///
	/// - parameter components: A `DateComponents`
	///
	/// - returns: The inverse `DateComponents` created.
	static prefix func - (components: DateComponents) -> DateComponents {
		var dateComponents = DateComponents()
		if let year = components.year {
			dateComponents.year = -year
		}
		if let month = components.month {
			dateComponents.month = -month
		}
		if let day = components.day {
			dateComponents.day = -day
		}
		if let hour = components.hour {
			dateComponents.hour = -hour
		}
		if let minute = components.minute {
			dateComponents.minute = -minute
		}
		if let second = components.second {
			dateComponents.second = -second
		}
		if let nanosecond = components.nanosecond {
			dateComponents.nanosecond = -nanosecond
		}
		return dateComponents
	}
	
	/// Creates a `DateComponents` calculated by the addition of right `DateComponents`
	/// and `DateComponents` left
	///
	/// - parameter left:  The `DateComponents` at left side.
	/// - parameter right: The `DateComponents` at right side.
	///
	/// - returns: The `DateComponents` calculated.
	static func + (left: DateComponents, right: DateComponents) -> DateComponents {
		var dateComponents = left
		if let year = right.year {
			dateComponents.year = (dateComponents.year ?? 0) + year
		}
		if let month = right.month {
			dateComponents.month = (dateComponents.month ?? 0) + month
		}
		if let day = right.day {
			dateComponents.day = (dateComponents.day ?? 0) + day
		}
		if let hour = right.hour {
			dateComponents.hour = (dateComponents.hour ?? 0) + hour
		}
		if let minute = right.minute {
			dateComponents.minute = (dateComponents.minute ?? 0) + minute
		}
		if let second = right.second {
			dateComponents.second = (dateComponents.second ?? 0) + second
		}
		if let nanosecond = right.nanosecond {
			dateComponents.nanosecond = (dateComponents.nanosecond ?? 0) + nanosecond
		}
		return dateComponents
	}
	
	/// Creates a `DateComponents` calculated by the subtraction of right `DateComponents`
	/// and `DateComponents` left
	///
	/// - parameter left:  The `DateComponents` at left side.
	/// - parameter right: The `DateComponents` at right side.
	///
	/// - returns: The `DateComponents` calculated.
	static func - (left: DateComponents, right: DateComponents) -> DateComponents {
		return left + (-right)
	}
}
