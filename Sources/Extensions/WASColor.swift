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

private enum WASBrightnessType: Int {
	case WASbrightnessDarker
	case WASbrightnessLighter
}

//**********************************************************************************************************
//
// MARK: - Class -
//
//**********************************************************************************************************

extension UIColor {
	
//**************************************************
// MARK: - Properties
//**************************************************

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
	public convenience init?(r: Int, g: Int, b: Int, a: CGFloat) {
		
		let red = CGFloat(r) / 255.0
		let green = CGFloat(g) / 255.0
		let blue = CGFloat(b) / 255.0
		self.init(red: red, green: green, blue: blue, alpha: CGFloat(a))
	}
	
//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Private Methods
//**************************************************

	private func brightness(brightnessType: WASBrightnessType) -> UIColor {
		
		var h: CGFloat = 0
		var s: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		
		var finishColor: UIColor = self
		
		if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
			
			var brightness = b
			if brightnessType == .WASbrightnessLighter {
				brightness = min((b * 1.3), 1.0)
			} else if brightnessType == .WASbrightnessDarker {
				brightness = (b * 0.75)
			}
			
			finishColor = UIColor(hue: h, saturation: s, brightness: brightness, alpha: a)
		}
		
		return finishColor
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************

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
			
			//  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
			intColor = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
		}
		
		return intColor
	}
	
	//*************************
	// MARK: Brightness
	//*************************
	
	/**
	Return a lighter color using the brightness.
	
	- returns: Lighter color.
	*/
	public func WASLighterColor() -> UIColor {
		return self.brightness(.WASbrightnessLighter)
	}
	
	/**
	Return a darker color using the brightness.
	
	- returns: Darker color.
	*/
	public func WASDarkerColor() -> UIColor {
		return self.brightness(.WASbrightnessDarker)
	}
	
	//*************************
	// MARK: Colors
	//*************************
	
	/**
	Return a custom color using r:155, g: 155, b: 155, a: 0.2 to use in separators
	
	- parameter a: Alpha value. Default 0.2
	
	- returns: Custom pink color.
	*/
	class func WASLineColor(alpha: CGFloat = 0.2) -> UIColor {
		return UIColor(r:155, g: 155, b: 155, a: alpha)!
	}
	
	/**
	Return a custom color using r: 80, g: 210, b: 194
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom pink color.
	*/
	public class func WASPinkColor(alpha: CGFloat = 1) -> UIColor {
		return UIColor(r: 80, g: 210, b: 194, a: alpha)!
	}
	
	/**
	Return a custom color using r: 140, g: 136, b: 255
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom purple color.
	*/
	public class func WASPurpleColor(alpha: CGFloat = 1) -> UIColor {
		return UIColor(r: 140, g: 136, b: 255, a: alpha)!
	}
	
	/**
	Return a custom color using r: 238, g: 143, b: 110
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom orange color.
	*/
	public class func WASOrangeColor(alpha: CGFloat = 1) -> UIColor {
		return UIColor(r: 238, g: 143, b: 110, a: alpha)!
	}

	/**
	Return a custom color using r: 255, g: 255, b: 208
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom yellow color.
	*/
	public class func WASYellowColor(alpha: CGFloat = 1) -> UIColor {
		return UIColor(r: 255, g: 255, b: 208, a: alpha)!
	}
	
	/**
	Return a custom color using r: 255, g: 255, b: 208
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom red color.
	*/
	public class func WASRedColor(alpha: CGFloat = 1) -> UIColor {
		return UIColor(r: 242, g: 89, b: 75, a: alpha)!
	}

}
