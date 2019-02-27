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

/// Some regular expressions pre difined.
///
/// - Regexs:
///   - mentions: Always starts with an '@' and ends when hitting a non-word character.
///   - colors: Always starts with an '#' and there are 6 characters.
///   - url: Any URLs.
///   - startWith: Always starts with a character defined on string paramenter.
///   - instagramUser: Always starts with a character (`@` is default) defined on string paramenter.
///
public struct WASRegex {

	/// Regex for @mentions matches.
	static public var mentions: String {
		return WASRegex.startWith(string: "@")
	}
	
	/// Regex for hexa decimal strings.
	static public var colors: String {
		return "#(?:[0-9A-Fa-f]{2}){3}"
	}
	
	/// Regex for url matches.
	static public var url: String {
		var regex = "((?:http|https)://)?"
		regex += "(?:www\\.)?"
		regex += "[\\w\\d\\-_]+\\.\\w{2,3}"
		regex += "(\\.\\w{2})?"
		regex += "(/(?<=/)"
		regex += "(?:[\\w\\d\\-./_]+)?)?"
		return regex
	}
	
	/// Regex for start with string matches.
	///
	/// - Parameter string: An `String` that will start the word.
	/// - Returns: A regex formated.
	static public func startWith(string: String) -> String {
		return "(?<=\\W|^)(\(string))(\\w+)"
	}

	/// Regex for instagram user.
	///
	/// - Parameter string: An `String` that will start the user. Default is `@`
	/// - Returns: A regex formated.
	static func instagramUser(startWith string: String = "@") -> String {
		return "(?:\(string))([A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\\.(?!\\.))){0,28}(?:[A-Za-z0-9_]))?)"
	}
}
