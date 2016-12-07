//
//  WASColor.swift
//  WASKit
//
//  Created by Wagner Sales on 4/26/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**********************************************************************************************************
//
// MARK: - Constants -
//
//**********************************************************************************************************

//**********************************************************************************************************
//
// MARK: - Definitions -
//
//**********************************************************************************************************

//**********************************************************************************************************
//
// MARK: - Class -
//
//**********************************************************************************************************

extension UIColor {
	
//**************************************************
// MARK: - Constructors
//**************************************************

	/**
	Construct a UIColor using an Int Value RGB formatted value and an alpha value
	
	- parameter r: Red Int value.
	- parameter g: Green Int value.
	- parameter b: Blue Int Value
	- parameter a: Alpha value.
	
	- returns: An UIColor instance that represent the required color
	*/
	public convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
		
		let red		= CGFloat(r) / 255.0
		let green	= CGFloat(g) / 255.0
		let blue	= CGFloat(b) / 255.0
		self.init(red: red, green: green, blue: blue, alpha: CGFloat(a))
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************

	/**
	Return a gray color.
	
	- parameter c: Color. Default 50
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom pink color.
	*/
	public class func WASGray(c: Int = 50, a: CGFloat = 1.0) -> UIColor {
		return UIColor(r:c, g: c, b: c, a: a)
	}
	
	//*************************
	// MARK: Helpers
	//*************************
	
	/**
	Convert color to UInt
	
	- returns: UInt number.
	*/
	public func WASColorToUInt() -> UInt? {
		
		var intColor: UInt?
		
		var fRed : CGFloat = 0, fGreen : CGFloat = 0, fBlue : CGFloat = 0, fAlpha: CGFloat = 0
		if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
			let iRed	= UInt(fRed * 255.0)
			let iGreen	= UInt(fGreen * 255.0)
			let iBlue	= UInt(fBlue * 255.0)
			let iAlpha	= UInt(fAlpha * 255.0)
			
			intColor = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
		}
		
		return intColor
	}
	
}
