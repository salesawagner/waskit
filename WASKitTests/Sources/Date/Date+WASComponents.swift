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

class WASComponents: DateTests {
	func testWASera() {
		XCTAssertEqual(self.date.WASera, self.era)
	}
	func testWASyear() {
		XCTAssertEqual(self.date.WASyear, self.year)
	}
	func testWASday() {
		XCTAssertEqual(self.date.WASday, self.day)
	}
	func testWASmonth() {
		XCTAssertEqual(self.date.WASmonth, self.month)
	}
	func testWAShour() {
		XCTAssertEqual(self.date.WAShour, self.hour)
	}
	func testWASminute() {
		XCTAssertEqual(self.date.WASminute, self.minute)
	}
	func testWASsecond() {
		XCTAssertEqual(self.date.WASsecond, self.second)
	}
	func testWASnanosecond() {
		XCTAssertEqual(self.date.WASnanosecond, self.nanosecond)
	}
}
