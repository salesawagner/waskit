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

import XCTest
import WASKit

class WASStringUtilsTests: XCTestCase {
	let string = "wagner"
	let emptyString = ""
    func testTrim() {
		var startSpace = " " + self.string
		var endSpace = self.string + " "
		var spaces = " " + self.string + " "
		var empty = self.emptyString
		XCTAssertEqual(self.emptyString.trim(), self.emptyString)
		XCTAssertEqual(startSpace.trim(), self.string)
		XCTAssertEqual(endSpace.trim(), self.string)
		XCTAssertEqual(spaces.trim(), self.string)
		// In place
		empty.trimInPlace()
		startSpace.trimInPlace()
		endSpace.trimInPlace()
		spaces.trimInPlace()
		XCTAssertEqual(empty, self.emptyString)
		XCTAssertEqual(startSpace, self.string)
		XCTAssertEqual(endSpace, self.string)
		XCTAssertEqual(spaces, self.string)
    }
	func testRemoveString() {
		let toRemove = "@"
		var empty = self.emptyString
		var string = toRemove + self.string
		XCTAssertEqual(empty.remove(toRemove), empty)
		XCTAssertEqual(string.remove(toRemove), self.string)
		// In place
		empty.removeInPlace(toRemove)
		string.removeInPlace(toRemove)
		XCTAssertEqual(empty, self.emptyString)
		XCTAssertEqual(string, self.string)
	}
	func testAbreviation() {
		let characteres = self.string.characters.count
		let expected = self.string + " ..."
		var string = self.string + "sales"
		XCTAssertEqual(self.emptyString.abbreviation(characteres), self.emptyString)
		XCTAssertEqual(string.abbreviation(characteres), expected)
		// In place
		string.abbreviationInPlace(characteres)
		XCTAssertEqual(string, expected)
	}
	func testCapitalizeFirst() {
		var string = self.string
		let expected = "Wagner"
		XCTAssertEqual(self.emptyString.capitalizeFirst(), self.emptyString)
		XCTAssertEqual(string.capitalizeFirst(), expected)
		// In place
		string.capitalizeFirstInPlace()
		XCTAssertEqual(string, expected)
	}
	func testIsHexaDecimal() {
		XCTAssertTrue("#FFFFFF".isHexaDecimal())
		XCTAssertTrue("#ffffff".isHexaDecimal())
		XCTAssertTrue("FFFFFF".isHexaDecimal())
		XCTAssertTrue("ffffff".isHexaDecimal())
		XCTAssertTrue("000000".isHexaDecimal())
		XCTAssertFalse("HHHHHH".isHexaDecimal())
		XCTAssertFalse("#HHHHHH".isHexaDecimal())
		XCTAssertFalse(self.emptyString.isHexaDecimal())
	}
	func testConvertToColor() {
		XCTAssertEqual("#FFFFFF".toColor().WAStoUInt(), UIColor.white.WAStoUInt())
		XCTAssertEqual("invalid".toColor().WAStoUInt(), UIColor.black.WAStoUInt())
		XCTAssertEqual("3498db".toColor().WAStoUInt(), UIColor(52, 152, 219).WAStoUInt())
		XCTAssertEqual("#EBEBEB".toColor().WAStoUInt(), UIColor(grayScale: 235).WAStoUInt())
	}
}
