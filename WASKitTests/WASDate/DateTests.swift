//
//  DateTests.swift
//  WASKit
//
//  Created by Wagner Sales on 13/12/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
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
			calendar: self.calendar
		)
	}
}
