//
//  WASKit
//
//  Copyright (c) Wagner Sales (http://salesawagner.com/)
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

import UIKit

extension Date {
	//*************************
	// MARK: Private methods
	//*************************
	private func components(from date: Date) -> DateComponents {
		let current = Calendar.current
		return current.dateComponents(kComponentFlags, from: date, to: self)
	}
	//*************************
	// MARK: Public methods
	//*************************
	/// The second(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The second(s) offset.
	public func WASseconds(from date: Date) -> Int {
		return self.components(from: date).second!
	}
	/// The minute(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The minute(s) offset.
	public func WASminutes(from date: Date) -> Int {
		return self.components(from: date).minute!
	}
	/// The hour(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The hour(s) offset.
	public func WAShours(from date: Date) -> Int {
		return self.components(from: date).hour!
	}
	/// The day(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The day(s) offset.
	public func WASdays(from date: Date) -> Int {
		return self.components(from: date).day!
	}
	/// The week(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The week(s) offset.
	public func WASweeks(from date: Date) -> Int {
		return self.components(from: date).weekOfYear!
	}
	/// The month(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The month(s) offset.
	public func WASmonths(from date: Date) -> Int {
		return self.components(from: date).month!
	}
	/// The year(s) offset from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: The year(s) offset.
	public func WASyears(from date: Date) -> Int {
		return self.components(from: date).year!
	}
	/// Human offset `String` from `Date`.
	///
	/// - Parameter date: The `Date` from be calculated.
	/// - Returns: Human `String`.
	public func WAStoStringAgo(_ date: Date) -> String {
		var string = ""
		if WASyears(from: date) > 0 {
			string = "\(WASyears(from: date))y"
		} else if WASmonths(from: date) > 0 {
			string = "\(WASmonths(from: date))M"
		} else if WASweeks(from: date) > 0 {
			string = "\(WASweeks(from: date))w"
		} else if WASdays(from: date) > 0 {
			string = "\(WASdays(from: date))d"
		} else if WAShours(from: date) > 0 {
			string = "\(WAShours(from: date))h"
		} else if WASminutes(from: date) > 0 {
			string = "\(WASminutes(from: date))m"
		} else if WASseconds(from: date) > 0 {
			string = "\(WASseconds(from: date))s"
		}
		return string
	}
}
