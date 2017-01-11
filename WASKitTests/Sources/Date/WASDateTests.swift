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
import WASKit

class WASDate: DateTests {
	func testFullInitialization() {
		let date = Date(
			era: self.era,
			year: self.year,
			month: self.month,
			day: self.day,
			hour: self.hour,
			minute: self.minute,
			second: self.second,
			nanosecond: self.nanosecond,
			timeZone: self.timeZone,
			calendar: self.calendar
		)
		let components = self.calendar.dateComponents(flags, from: date)
		let stringExpected = "Sunday, October 8, 1984 at 4:30:10 PM"
		let str = date.WAStoString(dateStyle: .full, timeStyle: .medium, timeZone: self.timeZone)
		XCTAssertEqual(str, stringExpected)
		XCTAssertEqual(components.era, self.era)
		XCTAssertEqual(components.year, self.year)
		XCTAssertEqual(components.month, self.month)
		XCTAssertEqual(components.day, self.day)
		XCTAssertEqual(components.hour, self.hour)
		XCTAssertEqual(components.minute, self.minute)
		XCTAssertEqual(components.second, self.second)
		XCTAssertEqual(components.nanosecond, self.nanosecond)
	}
	func testSimpleInitialization() {
		let date = Date(
			year: self.year,
			month: self.month,
			day: self.day
		)
		let components = self.calendar.dateComponents(flags, from: date)
		let nowComponents = self.calendar.dateComponents(flags, from: Date())
		XCTAssertEqual(components.year, self.year)
		XCTAssertEqual(components.month, self.month)
		XCTAssertEqual(components.day, self.day)
		XCTAssertEqual(components.hour, nowComponents.hour)
		XCTAssertEqual(components.minute, nowComponents.minute)
		XCTAssertEqual(components.second, nowComponents.second)
	}
	func testYesterdayInitialization() {
		let yesterday = Date.WASyesterday
		let yesterdayComponents = self.calendar.dateComponents(flags, from: yesterday)
		let components = self.calendar.dateComponents(flags, from: (Date() - 1.day))
		XCTAssertEqual(yesterdayComponents.year, components.year)
		XCTAssertEqual(yesterdayComponents.month, components.month)
		XCTAssertEqual(yesterdayComponents.day, components.day)
		XCTAssertEqual(yesterdayComponents.hour, components.hour)
		XCTAssertEqual(yesterdayComponents.minute, components.minute)
		XCTAssertEqual(yesterdayComponents.second, components.second)
	}
	func testTomorrowInitialization() {
		let tomorrow = Date.WAStomorrow
		let tomorrowComponents = self.calendar.dateComponents(flags, from: tomorrow)
		let components = self.calendar.dateComponents(flags, from: (Date() + 1.day))
		XCTAssertEqual(tomorrowComponents.year, components.year)
		XCTAssertEqual(tomorrowComponents.month, components.month)
		XCTAssertEqual(tomorrowComponents.day, components.day)
		XCTAssertEqual(tomorrowComponents.hour, components.hour)
		XCTAssertEqual(tomorrowComponents.minute, components.minute)
		XCTAssertEqual(tomorrowComponents.second, components.second)
	}
}
