//
//  WASKit
//
//  Copyright (c) Wagner Sales (http://wagnersales.com.br/)
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

public extension UIColor {
	
// MARK: - Public properties
	
	public var WASdescription: String {
		let RGBA = self.WAStoRGBA
		return "red:\(RGBA.r) green:\(RGBA.g) blue:\(RGBA.b) alpha:\(RGBA.a)"
	}
	
	public var WASred: UInt8 {
		return self.WAStoRGBA.r
	}
	
	public var WASgreen: UInt8 {
		return self.WAStoRGBA.g
	}
	
	public var WASblue: UInt8 {
		return self.WAStoRGBA.b
	}
	
	public var WASalpha: CGFloat {
		return self.WAStoRGBA.a
	}
	
	/// Returns the RGBA components.
	///
	/// - Returns: The RGBA components as a tuple (r, g, b, a).
	// swiftlint:disable large_tuple
	public var WAStoRGBA: (r: UInt8, g: UInt8, b: UInt8, a: CGFloat) {
		func toUInt(_ value: CGFloat) -> UInt8 {
			let multi = CGFloat(255)
			return UInt8(value * multi)
		}
		var r = CGFloat(0)
		var g = CGFloat(0)
		var b = CGFloat(0)
		var a = CGFloat(0)
		getRed(&r, green: &g, blue: &b, alpha: &a)
		return (toUInt(r), toUInt(g), toUInt(b), a)
	}
	
	/// Returns the `UInt` representation.
	///
	/// - Returns: `UInt` value.
	public var WAStoUInt: UInt32 {
		let RGBA = self.WAStoRGBA
		let a = (UInt32(RGBA.a * 255) << 24)
		let r = (UInt32(RGBA.r) << 16)
		let g = (UInt32(RGBA.g) << 8)
		let b = UInt32(RGBA.b)
		return r + g + b + a
	}
	
	/// Returns the hexa decimal representation.
	///
	/// - Returns: `UInt32` value.
	public var WAStoHexaDecimal: UInt32 {
		let RGBA = self.WAStoRGBA
		let r = UInt32(RGBA.r)
		let g = UInt32(RGBA.g)
		let b = UInt32(RGBA.b)
		let colorToInt = UInt32(r) << 16 | UInt32(g) << 8 | UInt32(b)
		return colorToInt
	}
	
	/// Returns the hexa decimal representation.
	///
	/// - Returns: `String` value.
	public var WAStoString: String {
		return String(format: "#%06x", self.WAStoHexaDecimal)
	}
}
