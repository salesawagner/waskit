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

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

let kComponentFlags = Set<Calendar.Component>([
	.era,
	.timeZone,
	.year,
	.month,
	.day,
	.hour,
	.minute,
	.second,
	.nanosecond,
	.weekday,
	.weekdayOrdinal,
	.weekOfYear
])

//**************************************************************************************************
//
// MARK: - Extension - Date
//
//**************************************************************************************************

extension Date {
	/// The `DateComponents`
	public var WASdateComponents: DateComponents {
		return Calendar.current.dateComponents(kComponentFlags, from: self)
	}
	/// The era value.
	public var WASera: Int {
		return self.WASdateComponents.era!
	}
	/// The year value.
	public var WASyear: Int {
		return self.WASdateComponents.year!
	}
	/// The day value.
	public var WASday: Int {
		return self.WASdateComponents.day!
	}
	/// The month value.
	public var WASmonth: Int {
		return self.WASdateComponents.month!
	}
	/// The hour value.
	public var WAShour: Int {
		return self.WASdateComponents.hour!
	}
	/// The minute value.
	public var WASminute: Int {
		return self.WASdateComponents.minute!
	}
	/// The second value.
	public var WASsecond: Int {
		return self.WASdateComponents.second!
	}
	/// The nanosecond value.
	public var WASnanosecond: Int {
		return self.WASdateComponents.nanosecond!
	}
}
