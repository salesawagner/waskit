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

import Foundation

public extension String {
	
	// MARK: - Public properties
	
	/// Get all mentions.
	///
	/// - Note:
	/// Always starts with an '@' and ends when hitting a non-word character.
	///
	/// - Example:
	/// "@wagner you around?".WASmentions return `["@wagner"]`
	///
	/// - Returns: An `Array` of `String` with all mentions.
	public var WASmentions: [String] {
		return self.WASMatchesForRegex(regex: WASRegex.mentions)
	}
	
	/// Get all hexa decimal colors.
	///
	/// - Note:
	/// Always starts with an '#' and there are 6 characters.
	///
	/// - Example:
	/// "#FF00FF is a nice color".WAScolors return `["#FF00FF"]`
	///
	/// - Returns: An `Array` of `String` with all hexa decimal colors.
	public var WAScolors: [String] {
		return self.WASMatchesForRegex(regex: WASRegex.colors)
	}
	
	/// Get all urls colors `String`.
	///
	/// - Example:
	/// "Did you see http://www.wagnersales.com.br ?".WASurls
	/// return `["http://www.wagnersales.com.br"]`
	///
	/// - Returns: An `Array` of `String` with all urls.
	public var WASurls: [String] {
		return self.WASMatchesForRegex(regex: WASRegex.url)
	}
	
	// MARK: - Public methods
	
	/// Always starts with a character defined on string paramenter.
	///
	/// - Note:
	/// Always starts with an `parameter` and ends when hitting a non-word character.
	///
	/// - Parameter string: An `Array` of `String` with all `String` that start with paramenter.
	public func WASstart(with string: String) -> [String] {
		let regex = WASRegex.startWith(string: string)
		return self.WASMatchesForRegex(regex: regex)
	}
	
	/// Get all instagram users.
	///
	/// - Note:
	/// Always starts with an `parameter` and ends when hitting a non-word character.
	///
	/// - Parameter string: An `Array` of `String` with all `String` that start with paramenter.
	public func WASInatgramUsers(with string: String) -> [String] {
		let regex = WASRegex.startWith(string: string)
		return self.WASMatchesForRegex(regex: regex)
	}
}
