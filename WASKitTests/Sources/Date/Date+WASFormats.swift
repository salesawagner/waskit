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

class WASFormats: DateTests {
	/// - Example:
	///   - `Date().WAStoString(dateStyle: .short, timeStyle: .short)`
	///   - `Date().WAStoString(dateStyle: .short)`
	///   - `Date().WAStoString(timeStyle: .short)`

	///  - `NoStyle`
	///  - `ShortStyle`		1/27/10, 1:00 PM
	///  - `MediumStyle`	Jan 27, 2010, 1:00:00 PM
	///  - `LongStyle`		January 27, 2010 at 1:00:00 PM EST
	///  - `FullStyle`		Wednesday, January 27, 2010 at 1:00:00 PM Eastern Standard Time
	func testWAStoString() {
		XCTAssertNotNil(self.date.WAStoString())
	}
	func testWAStoShortString() {
		let dateToString = self.date.WAStoString(dateStyle: .short)
		let dateToTime = self.date.WAStoString(timeStyle: .short)
		let dateTimeToString = self.date.WAStoString(dateStyle: .short, timeStyle: .short)
		
		let expectedDate = "10/8/84"
		let expectedTime = "4:30 PM"
		XCTAssertEqual(dateToString, "\(expectedDate)")
		XCTAssertEqual(dateToTime, "\(expectedTime)")
		XCTAssertEqual(dateTimeToString, "\(expectedDate), \(expectedTime)")
	}
	func testWAStoMediumString() {
		let dateToString = self.date.WAStoString(dateStyle: .medium)
		let dateToTime = self.date.WAStoString(timeStyle: .medium)
		let dateTimeToString = self.date.WAStoString(dateStyle: .medium, timeStyle: .medium)
		
		let expectedDate = "Oct 8, 1984"
		let expectedTime = "4:30:10 PM"
		XCTAssertEqual(dateToString, "\(expectedDate)")
		XCTAssertEqual(dateToTime, "\(expectedTime)")
		XCTAssertEqual(dateTimeToString, "\(expectedDate), \(expectedTime)")
	}
	func testWAStoLongString() {
		let dateToString = self.date.WAStoString(dateStyle: .long)
		let dateToTime = self.date.WAStoString(timeStyle: .long)
		let dateTimeToString = self.date.WAStoString(dateStyle: .long, timeStyle: .long)
		
		let expectedDate = "October 8, 1984"
		let expectedTime = "4:30:10 PM GMT-3:06:28"
		XCTAssertEqual(dateToString, "\(expectedDate)")
		XCTAssertEqual(dateToTime, "\(expectedTime)")
		XCTAssertEqual(dateTimeToString, "\(expectedDate) at \(expectedTime)")
	}
	func testWAStoFullString() {
		let dateToString = self.date.WAStoString(dateStyle: .full)
		let dateToTime = self.date.WAStoString(timeStyle: .full)
		let dateTimeToString = self.date.WAStoString(dateStyle: .full, timeStyle: .full)
		
		let expectedDate = "Sunday, October 8, 1984"
		let expectedTime = "4:30:10 PM GMT-3:06:28"
		XCTAssertEqual(dateToString, "\(expectedDate)")
		XCTAssertEqual(dateToTime, "\(expectedTime)")
		XCTAssertEqual(dateTimeToString, "\(expectedDate) at \(expectedTime)")
	}
	func testWAStoStringWithFormat() {
	}
}
