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

public extension String {
	
// MARK: - Public properties
	
	/// Trimming white spaces and new lines.
	///
	/// - Returns: The `String` Trimmed.
	public var WAStrimmed: String {
		return self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	/// Capitalize the first charactere.
	///
	/// - Returns: The `String` with the first letter capitalized.
	public var WAScapitalizeFirst: String {
		if self.isEmpty {
			return self
		}
		let first: String = String(self.prefix(1)).capitalized
		let other: String = String(self.dropFirst())
		return first + other
	}
	
	/// Validate with the `String` is an hexa decimal number.
	///
	/// - Returns: If hexa decima `true`, if not `false`
	public var WASisHexaDecimal: Bool {
		if self.isEmpty {
			return false
		}
		let string: String = self.uppercased().WASremove("#")
		let chars: CharacterSet = NSCharacterSet(charactersIn: "0123456789ABCDEF").inverted
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
	public var WAStoColor: UIColor {
		return UIColor(string: self)
	}

// MARK: - Public methods
	
	/// Remove the `String` parameter.
	///
	/// - Parameter string: A `String` that will be removed.
	/// - Returns: `String` without the `String` parameter.
	public func WASremove(_ string: String) -> String {
		return self.replacingOccurrences(of: string, with: "")
	}
	
	/// Abrevite the `String` with the characters count.
	///
	/// - Parameter characteres: The Number of characters the `String` needs to have.
	/// - Returns: The `String` abreviated.
	public func WASabbreviation(_ characteres: Int) -> String {
		if self.isEmpty && self.count <= characteres {
			return self
		}
		let index: String.Index = self.index(self.startIndex, offsetBy: characteres)
		let substring: String = String(self[..<index])
		return substring.WAStrimmed + " ..."
	}
	
// MARK: - Public mutating methods
	
	/// Mutating trimming white spaces and new lines.
	public mutating func WAStrimmedInPlace() {
		self = self.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	/// Mutating remove the `String` parameter.
	///
	/// - Parameter string: A `String` that will be removed.
	public mutating func WASremoveInPlace(_ string: String) {
		self = self.replacingOccurrences(of: string, with: "")
	}
	
	/// Mutating abrevite the `String` with the characters count.
	///
	/// - Parameter characteres: The Number of characters the `String` needs to have.
	public mutating func WASabbreviationInPlace(_ characteres: Int) {
		self = self.WASabbreviation(characteres)
	}
	
	/// Mutating capitalize the first character.
	public mutating func WAScapitalizeFirstInPlace() {
		self = self.WAScapitalizeFirst
	}
}
