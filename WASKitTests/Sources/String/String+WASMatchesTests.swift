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

class WASStringMatchesTests: XCTestCase {
	let validColor = "#FFFFFF"
	let invalidColor = "#HH7113"
	let validMention = "@wagner"
	let invalidMention = "wagner"
	let validUrl = "http://www.wagnersales.com.br"
	func testColors() {
		let string = "Nice color " + self.validColor
		let countExpected = 1
		XCTAssertEqual(string.WAScolors().count, countExpected)
		XCTAssertEqual(string.WAScolors().first!, self.validColor)
	}
	func testColorsFail() {
		let string = "Nice color " + self.invalidColor
		let countExpected = 0
		XCTAssertEqual(string.WAScolors().count, countExpected)
		XCTAssertNil(string.WAScolors().first)
	}
	func testMentions() {
		let string = self.validMention + " you around?"
		let countExpected = 1
		XCTAssertEqual(string.WASmentions().count, countExpected)
		XCTAssertEqual(string.WASmentions().first!, self.validMention)
	}
	func testMentionsInvalid() {
		let string = self.invalidMention + " you around?"
		let countExpected = 0
		XCTAssertEqual(string.WASmentions().count, countExpected)
		XCTAssertNil(string.WASmentions().first)
	}
	func testUrls() {
		let string = "Did you see \(self.validUrl) ?"
		let countExpected = 1
		XCTAssertEqual(string.WASurls().count, countExpected)
		XCTAssertEqual(string.WASurls().first!, self.validUrl)
	}
	func testStart() {
		let string = self.validMention + " you around?"
		let countExpected = 1
		let matches = string.WASstart(with: "@")
		XCTAssertEqual(matches.count, countExpected)
		XCTAssertEqual(matches.first!, self.validMention)
	}
}
