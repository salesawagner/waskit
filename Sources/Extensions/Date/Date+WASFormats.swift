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

public extension Date {
	
// MARK: - Public methods
	
	/// Create a date `String` using the receiver formatted date style and/or time style.
	///
	/// - Note:
	///  - `NoStyle`		= ""
	///  - `ShortStyle`		= 1/27/10, 1:00 PM
	///  - `MediumStyle`	= Jan 27, 2010, 1:00:00 PM
	///  - `LongStyle`		= January 27, 2010 at 1:00:00 PM EST
	///  - `FullStyle`		= Wednesday, January 27, 2010 at 1:00:00 PM Eastern Standard Time
	///
	/// ### Usage Example: ###
	/// ```
	///   Date().WAStoString(dateStyle: .short, timeStyle: .short)
	///   Date().WAStoString(dateStyle: .short)
	///   Date().WAStoString(timeStyle: .short)
	/// ```
	///
	/// - Parameters:
	///   - dateStyle: The `DateFormatter.Style` value.
	///   - timeStyle: The `DateFormatter.Style` value.
	///   - locale: The `Locale` value. By default is `Locale.current`
	///   - timeZone: The `TimeZone` value. By default is `TimeZone.current`
	///
	/// - Returns: A date `String` formatted.
	public func WAStoString(
		dateStyle: DateFormatter.Style? = nil,
		timeStyle: DateFormatter.Style? = nil,
		locale: Locale = Locale.current,
		timeZone: TimeZone = TimeZone.current
	) -> String {
		let dateFormatter = DateFormatter()
		if let dateStyle = dateStyle {
			dateFormatter.dateStyle = dateStyle
		}
		if let timeStyle = timeStyle {
			dateFormatter.timeStyle = timeStyle
		}
		dateFormatter.locale = locale
		dateFormatter.timeZone = timeZone
		return dateFormatter.string(from: self)
	}
	
	/// Create a date `String` using the `format` value.
	///
	/// - Note:
	///	 - Year: 'y' Month: 'M' Day: 'd'		= Year: 2007 Month: 1 Day: 9
	///	 - MM/dd/yy								= 01/09/07
	///	 - MMM dd, yyyy							= Jan 09, 2007
	///	 - E MMM dd, yyyy						= Tue Jan 09, 2007
	///	 - EEEE, MMMM dd, yyyy' at 'h:mm a.		= Tuesday, January 09, 2007 at 10:00 AM.
	///
	/// ### Usage Example: ###
	/// ```
	/// WAStoString(format: "dd/MM/YYYY HH:mm a")
	/// ```
	///
	/// - Parameters:
	///   - format: The `String` format value.
	///   - locale: The `Locale` value. By default is `Locale.current`
	///   - timeZone: The `TimeZone` value. By default is `TimeZone.current`
	///
	/// - Returns: A date `String` formatted.
	public func WAStoString(
		format: String,
		locale: Locale = Locale.current,
		timeZone: TimeZone = TimeZone.current
	) -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		dateFormatter.locale = locale
		dateFormatter.timeZone = timeZone
		return dateFormatter.string(from: self)
	}
}
