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

extension UIColor {
	/// Create a `UIColor` using an `UInt8` value RGB formatted and an alpha `CGFloat` value.
	/// 
	/// - Example:
	///   - `UIColor(10, 20, 30)`
	///   - `UIColor(10, 20, 30, 0.5)`
	///
	/// - Parameters:
	///   - r: Red `UInt8` value.
	///   - g: Green `UInt8` value.
	///   - b: Blue `UInt8` Value
	///   - a: Alpha `CGFloat` value. By default 1.0
	// swiftlint:disable variable_name
	public convenience init(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: CGFloat = 1.0) {
		let divisor	= CGFloat(255.0)
		let r = CGFloat(r) / divisor
		let g = CGFloat(g) / divisor
		let b = CGFloat(b) / divisor
		self.init(red: r, green: g, blue: b, alpha: a)
	}
	/// Create a `UIColor` using an `UInt8` value RGB formatted and an alpha `CGFloat` value.
	///
	/// - Example:
	///   - `UIColor(10, 20, 30)`
	///   - `UIColor(10, 20, 30, 0.5)`
	///
	/// - Parameters:
	///   - r: Red `UInt8` value.
	///   - g: Green `UInt8` value.
	///   - b: Blue `UInt8` Value
	///   - a: Alpha `CGFloat` value. By default 1.0
	public convenience init(r: UInt8, g: UInt8, b: UInt8, a: CGFloat = 1.0) {
		self.init(r, g, b, a)
	}
	/// Create a `UIColor` using an gray sacale `UInt8` value and an alpha `CGFloat` value.
	///
	/// - Example:
	///   - `UIColor(grayScale: 10)`
	///   - `UIColor(grayScale: 10, a: 0.5)`
	///
	/// - Parameters:
	///   - gray:  Gray scale `UInt8` value. By default 50.
	///   - a: Alpha `CGFloat` value. By default 1.0.
	public convenience init(grayScale gray: UInt8 = 50, a: CGFloat = 1.0) {
		self.init(gray, gray, gray, a)
	}
	/// Create a `UIColor` using hexa decimal `String` value.
	///
	/// - Note:
	/// If the given hexa decimal `String` is invalid the initialiser will create a black color.
	///
	/// - Example:
	///   - `UIColor(hexaString: "#3498db")`
	///   - `UIColor(hexaString: "3498db")`
	///
	/// - Parameter hexaDecimal: A hexa decimal color `String` value.
	public convenience init(string: String) {
		var string = string.trimmingCharacters(in: .whitespacesAndNewlines)
		string = string.remove("#")
		guard string.characters.count == 6, string.isHexaDecimal() else {
			self.init(0, 0, 0, 1)
			return
		}
		var rgb: UInt32 = 0
		Scanner(string: string).scanHexInt32(&rgb)
		let r = UInt8((rgb & 0xFF0000) >> 16)
		let g = UInt8((rgb & 0x00FF00) >> 8)
		let b = UInt8(rgb & 0x0000FF)
		self.init(r, g, b)
	}
}
