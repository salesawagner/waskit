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

public extension UIImage {

// MARK: - Public methods

	/// Returns a new version of the image scaled to the specified size.
	///
	/// - Parameter size: The size to use when scaling the new image.
	/// - Returns: Scaled image.
	public func WASresize(_ size: CGSize) -> UIImage {
		guard
			let cgImage = self.cgImage,
			let colorSpace = cgImage.colorSpace,
			size.width > 0,
			size.height > 0,
			let context = CGContext(data: nil,
			                        width: Int(size.width),
			                        height: Int(size.height),
			                        bitsPerComponent: cgImage.bitsPerComponent,
			                        bytesPerRow: cgImage.bytesPerRow,
			                        space: colorSpace,
			                        bitmapInfo: cgImage.bitmapInfo.rawValue) else {
			return self
		}
		context.interpolationQuality = .high
		context.draw(cgImage, in: CGRect(origin: CGPoint.zero, size: size))
		let scaled = context.makeImage().flatMap {
			UIImage(cgImage: $0)
		}
		return scaled ?? self
	}
	
	/// Returns a new version of the image scaled to the scale.
	///
	/// - Parameter scale: The scale to use when scaling the new image.
	/// - Returns: Scaled image.
	public func WASresizeWithScale(_ scale: CGFloat) -> UIImage {
		let width = self.size.width * scale
		let height = self.size.height * scale
		return self.WASresize(CGSize(width: width, height: height))
	}
	
	/// Returns a new version of the image cropped.
	///
	/// - Parameter rect: The rect to use when cropping the new image.
	/// - Returns: Cropped image.
	public func WAScrop(_ rect: CGRect) -> UIImage {
		guard
			let cgImage = self.cgImage,
			let cropped = cgImage.cropping(to: rect) else {
				return self
		}
		return UIImage(cgImage: cropped)
	}
}
