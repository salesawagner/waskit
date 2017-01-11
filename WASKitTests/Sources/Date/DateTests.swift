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

import XCTest

class DateTests: XCTestCase {
	let flags = Set<Calendar.Component>([
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
	let timeZone = TimeZone.current
	let calendar = Calendar.current
	let era = 0
	let year = 1984
	let month = 10
	let day = 08
	let hour = 16
	let minute = 30
	let second = 10
	let nanosecond = 00
	private(set) var date: Date = Date()
	override func setUp() {
		super.setUp()
		self.date = Date(
			era: self.era,
			year: self.year,
			month: self.month,
			day: self.day,
			hour: self.hour,
			minute: self.minute,
			second: self.second,
			nanosecond: self.nanosecond,
			timeZone: self.timeZone,
			calendar: self.calendar)
	}
}
