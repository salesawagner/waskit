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
	public func resize(_ size: CGSize) -> UIImage {
		
		var finishImage = self
		
		let cgImage = self.cgImage
		
		let width = Int(size.width)
		let height = Int(size.height)
		let bitsPerComponent = cgImage?.bitsPerComponent
		let bytesPerRow = cgImage?.bytesPerRow
		let colorSpace = cgImage?.colorSpace
		let bitmapInfo = cgImage?.bitmapInfo
		
		let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: bitsPerComponent!, bytesPerRow: bytesPerRow!, space: colorSpace!,
		                                    bitmapInfo: (bitmapInfo?.rawValue)!)
		
		context!.interpolationQuality = .high
		
		context?.draw(cgImage!, in: CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(width),
			height: CGFloat(height))))
		
		let scaledImage = context?.makeImage().flatMap { UIImage(cgImage: $0) }
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
	public func resizeWithScale(_ scale: CGFloat) -> UIImage {
		
		let width = self.size.width * scale
		let height = self.size.height * scale
		
		return self.resize(CGSize(width: width, height: height))
	}
	
	/**
	Returns a new version of the image cropped.
	
	- parameter rect: The rect to use when cropping the new image.
	
	- returns: Cropped image.
	*/
	public func crop(_ rect: CGRect) -> UIImage {
		
		var finishImage = self
		
		let cgImage = self.cgImage
		
		if let imageRef: CGImage = cgImage?.cropping(to: rect) {
			finishImage = UIImage(cgImage: imageRef)
		}
		
		return finishImage
	}
	
//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
}
