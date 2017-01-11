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

extension String {
	/// Trimming white spaces and new lines.
	///
	/// - Returns: The `String` Trimmed.
	public func trim() -> String {
		return self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	/// Mutating trimming white spaces and new lines.
	///
	/// - Returns: The `String` Trimmed.
	public mutating func trimInPlace() {
		self = self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	/// Remove the `String` parameter.
	///
	/// - Parameter string: A `String` that will be removed.
	/// - Returns: `String` without the `String` parameter.
	public func remove(_ string: String) -> String {
		return self.replacingOccurrences(of: string, with: "")
	}
	/// Mutating remove the `String` parameter.
	///
	/// - Parameter string: A `String` that will be removed.
	public mutating func removeInPlace(_ string: String) {
		self = self.replacingOccurrences(of: string, with: "")
	}
	/// Abrevite the `String` with the characters count.
	///
	/// - Parameter characteres: The Number of characters the `String` needs to have.
	/// - Returns: The `String` abreviated.
	public func abbreviation(_ characteres: Int) -> String {
		if self.isEmpty && self.characters.count <= characteres {
			return self
		}
		let index = self.index(self.startIndex, offsetBy: characteres)
		return self.substring(to: index).trim() + " ..."
	}
	/// Mutating abrevite the `String` with the characters count.
	///
	/// - Parameter characteres: The Number of characters the `String` needs to have.
	/// - Returns: The `String` abreviated.
	public mutating func abbreviationInPlace(_ characteres: Int) {
		self = self.abbreviation(characteres)
	}
	/// Capitalize the first charactere.
	///
	/// - Returns: The `String` with the first letter capitalized.
	public func capitalizeFirst() -> String {
		if self.isEmpty {
			return self
		}
		let first = String(self.characters.prefix(1)).capitalized
		let other = String(self.characters.dropFirst())
		return first + other
	}
	/// Mutating capitalize the first character.
	///
	/// - Returns: The `String` with the first letter capitalized.
	public mutating func capitalizeFirstInPlace() {
		self = self.capitalizeFirst()
	}
	/// Validate with the `String` is an hexa decimal number.
	///
	/// - Returns: If hexa decima `true`, if not `false`
	public func isHexaDecimal() -> Bool {
		if self.isEmpty {
			return false
		}
		let string = self.uppercased().remove("#")
		let chars = NSCharacterSet(charactersIn: "0123456789ABCDEF").inverted
		return string.rangeOfCharacter(from: chars) == nil
	}
	/// Convert hexa decilma to `UIColor`.
	///
	/// - Note:
	/// If the given hexa decimal `String` is invalid the initialiser will create a black color.
	///
	/// - Example:
	///   - `UIColor(string: "#3498db")`
	///   - `UIColor(string: "3498db")`
	///
	/// - Returns: The `UIColor`.
	public func toColor() -> UIColor {
		return UIColor(string: self)
	}
}
