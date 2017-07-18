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

public extension UIColor {

//*************************
// MARK: Public properties
//*************************
	
	/// Returns a lighter `UIColor` using the brightness.
	///
	/// - Example:
	///   - `UIColor.redcolor.WASlighter()`
	///
	/// - Returns: A lighter `UIColor`
	public var WASlighter: UIColor {
		return self.WASbrightness(.wasBrightnessLighter)
	}
	
	/// Returns a darker `UIColor` using the brightness.
	///
	/// - Example:
	///   - `UIColor.redcolor.WASdarkened()`
	///
	/// - Returns: A Darker `UIColor`.
	public var WASdarkened: UIColor {
		return self.WASbrightness(.wasBrightnessDarker)
	}
	
//*************************
// MARK: Private methods
//*************************

	private func WASbrightness(_ brightnessType: WASBrightnessType) -> UIColor {
		var h: CGFloat = 0
		var s: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		var finishColor: UIColor = self
		if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
			var brightness = b
			if brightnessType == .wasBrightnessLighter {
				brightness = min((b * 1.3), 1.0)
			} else if brightnessType == .wasBrightnessDarker {
				brightness = (b * 0.75)
			}
			finishColor = UIColor(hue: h, saturation: s, brightness: brightness, alpha: a)
		}
		return finishColor
	}
}
