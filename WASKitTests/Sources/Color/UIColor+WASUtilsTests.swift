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

class WASColorUtilsTests: XCTestCase {
	let r = UInt8(10)
	let g = UInt8(20)
	let b = UInt8(30)
	let a = CGFloat(0.5)
	var color: UIColor {
		return UIColor(self.r, self.g, self.b, self.a)
	}
	func testDescription() {
		let expected = "red:10 green:20 blue:30 alpha:0.5"
		XCTAssertEqual(self.color.WASdescription, expected)
	}
	func testWAStoRGBA() {
		let RGBA = self.color.WAStoRGBA
		let color = UIColor(RGBA.r, RGBA.g, RGBA.b, RGBA.a)
		XCTAssertEqual(RGBA.r, self.r)
		XCTAssertEqual(RGBA.g, self.g)
		XCTAssertEqual(RGBA.b, self.b)
		XCTAssertEqual(RGBA.a, self.a)
		XCTAssertEqual(self.color.WASred, self.r)
		XCTAssertEqual(self.color.WASgreen, self.g)
		XCTAssertEqual(self.color.WASblue, self.b)
		XCTAssertEqual(self.color.WASalpha, self.a)
		XCTAssertEqual(color.WAStoUInt, self.color.WAStoUInt)
	}
	func testWAStoInt() {
		XCTAssertEqual(UIColor.black.WAStoUInt, 4278190080)
		XCTAssertEqual(UIColor.white.WAStoUInt, 4294967295)
		XCTAssertEqual(UIColor.red.WAStoUInt, 4294901760)
		XCTAssertEqual(UIColor.green.WAStoUInt, 4278255360)
		XCTAssertEqual(UIColor.blue.WAStoUInt, 4278190335)
	}
	func testWAStoHexaDecimal() {
		XCTAssertEqual(UIColor.black.WAStoHexaDecimal, 0x000000)
		XCTAssertEqual(UIColor.white.WAStoHexaDecimal, 0xffffff)
		XCTAssertEqual(UIColor.red.WAStoHexaDecimal, 0xff0000)
		XCTAssertEqual(UIColor.green.WAStoHexaDecimal, 0x00ff00)
		XCTAssertEqual(UIColor.blue.WAStoHexaDecimal, 0x0000ff)
	}
	func testWAStoString() {
		XCTAssertEqual(UIColor.black.WAStoString, "#000000")
		XCTAssertEqual(UIColor.white.WAStoString, "#ffffff")
		XCTAssertEqual(UIColor.red.WAStoString, "#ff0000")
		XCTAssertEqual(UIColor.green.WAStoString, "#00ff00")
		XCTAssertEqual(UIColor.blue.WAStoString, "#0000ff")
	}
}
