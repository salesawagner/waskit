//
//  WASKit
//
//  Copyright (c) 2015-2016 Wagner Sales (http://salesawagner.com/)
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

public extension Int {
	/// The year `DateComponents` amount.
	var year: DateComponents {
		return DateComponents(year: self)
	}
	/// The month `DateComponents` amount.
	var month: DateComponents {
		return DateComponents(month: self)
	}
	/// The week `DateComponents` amount.
	var week: DateComponents {
		return DateComponents(day: 7 * self)
	}
	/// day `DateComponents` amount.
	var day: DateComponents {
		return DateComponents(day: self)
	}
	/// The hour `DateComponents` amount.
	var hour: DateComponents {
		return DateComponents(hour: self)
	}
	/// The minute `DateComponents` amount.
	var minute: DateComponents {
		return DateComponents(minute: self)
	}
	/// The second `DateComponents` amount.
	var second: DateComponents {
		return DateComponents(second: self)
	}
	/// The nanosecond `DateComponents` amount.
	var nanosecond: DateComponents {
		return DateComponents(nanosecond: self)
	}
}
