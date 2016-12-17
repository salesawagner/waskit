//
//  WASKit
//
//  Copyright (c) 2015-2016 Wagner Sales (http://salesawagner.com/)
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
	// MARK: Public static properties
	//*************************
	/// Creates a `Date` representing yesterday.
	public static var WASyesterday: Date {
		return Date() - 1.day
	}
	/// Creates a `Date` representing tomorrow.
	public static var WAStomorrow: Date {
		return Date() + 1.day
	}
	//*************************
	// MARK: Constructores
	//*************************
	/// Create a `Date` using an `Int` value for each `DateComponent`.
	///
	/// - Example:
	///   - `Date(year: 1984, month: 10, day: 08)
	///
	/// - Parameters:
	///   - year: year `Int` value.
	///   - month: month `Int` value.
	///   - day: day `Int` value.
	///   - hour: hour `Int` value. By default actual hour
	///   - minute: minute `Int` value. By default actual minute
	///   - second: second `Int` value. By default actual second
	///   - nanosecond: nanosecond `Int` value. By default actual nanosecond
	///   - era: Era `Int` value. By default actual era
	///   - timeZone: `TimeZone` value.
	///   - calendar: `Calendar` value. By default `Calendar.current`
	public init(
		era: Int? = nil,
		year: Int,
		month: Int,
		day: Int,
		hour: Int? = nil,
		minute: Int? = nil,
		second: Int? = nil,
		nanosecond: Int? = nil,
		timeZone: TimeZone? = nil,
		calendar: Calendar = Calendar.current
	) {
		let date = Date()
		var components = DateComponents()
		components.year	= year
		components.month = month
		components.day = day
		components.hour	= hour ?? date.WAShour
		components.minute = minute ?? date.WASminute
		components.second = second ?? date.WASsecond
		components.nanosecond = nanosecond ?? date.WASnanosecond
		components.era = era ?? date.WASera
		components.timeZone = timeZone
		if let date = calendar.date(from: components) {
			self.init(timeInterval: 0, since: date)
			return
		}
		self.init()
	}
}
