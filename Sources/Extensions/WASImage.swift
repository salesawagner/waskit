//
//  WASImage.swift
//  WASKit
//
//  Created by Wagner Sales on 4/27/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIImage {
	
//**************************************************
// MARK: - Properties
//**************************************************

//**************************************************
// MARK: - Constructors
//**************************************************

//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Private Methods
//**************************************************

//**************************************************
// MARK: - Public Methods
//**************************************************

	//*************************
	// MARK: Scaling
	//*************************
	
	/**
	Returns a new version of the image scaled to the specified size.
	
	- parameter size: The size to use when scaling the new image.
	
	- returns: Scaled image.
	*/
	public func resize(size: CGSize) -> UIImage {
		
		var finishImage = self
		
		let cgImage = self.CGImage
		
		let width = Int(size.width)
		let height = Int(size.height)
		let bitsPerComponent = CGImageGetBitsPerComponent(cgImage)
		let bytesPerRow = CGImageGetBytesPerRow(cgImage)
		let colorSpace = CGImageGetColorSpace(cgImage)
		let bitmapInfo = CGImageGetBitmapInfo(cgImage)
		
		let context = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colorSpace,
		                                    bitmapInfo.rawValue)
		
		CGContextSetInterpolationQuality(context, .High)
		
		CGContextDrawImage(context, CGRect(origin: CGPointZero, size: CGSize(width: CGFloat(width),
			height: CGFloat(height))), cgImage)
		
		let scaledImage = CGBitmapContextCreateImage(context).flatMap { UIImage(CGImage: $0) }
		if scaledImage != nil {
			finishImage = scaledImage!
		}
		
		return finishImage
	}
	
	/**
	Returns a new version of the image scaled to the scale.
	
	- parameter scale: The scale to use when scaling the new image.
	
	- returns: Scaled image.
	*/
	public func resizeWithScale(scale: CGFloat) -> UIImage {
		
		let width = self.size.width * scale
		let height = self.size.height * scale
		
		return self.resize(CGSizeMake(width, height))
	}
	
	/**
	Returns a new version of the image cropped.
	
	- parameter rect: The rect to use when cropping the new image.
	
	- returns: Cropped image.
	*/
	public func crop(rect: CGRect) -> UIImage {
		
		var finishImage = self
		
		let cgImage = self.CGImage
		
		if let imageRef: CGImageRef = CGImageCreateWithImageInRect(cgImage, rect) {
			finishImage = UIImage(CGImage: imageRef)
		}
		
		return finishImage
	}
	
//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
}