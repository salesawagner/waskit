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

extension Array where Element: Hashable {
	/// Remove duplicate elements.
	///
	/// - Returns: `Array` with unique elements.
	public func WASRemoveDuplicates() -> [Element] {
		var result: [Element] = []
		for value in self {
			if !result.contains(value) {
				result.append(value)
			}
		}
		return result
	}
	/// Remove duplicate elements.
	public mutating func WASRemoveDuplicatesInPlace() {
		self = self.WASRemoveDuplicates()
	}
	/// Convert `Array` to `String`
	///
	/// - Parameter separator: `String` to separate `Array` elements.
	/// - Returns: The `String` formatted.
	public func WASToString(separator: String? = nil) -> String {
		var filter = ""
		for element in self {
			if filter.isEmpty {
				filter = "\(element)"
			} else {
				filter += separator ?? "" + "\(element)"
			}
		}
		return filter
	}
	/// Print each `Array`'s objects.
	public func WASPrint() {
		for element in self {
			print(element)
		}
	}
}
