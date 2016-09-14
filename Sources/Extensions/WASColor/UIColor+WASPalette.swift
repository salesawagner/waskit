//
//  UIColor+WASColors.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIColor {

//**************************************************
// MARK: - Public Methods
//**************************************************
	
	/**
	Return a custom color using r: 80, g: 210, b: 194
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom green color.
	*/
	public class func WASGreenColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 80, g: 210, b: 194, a: alpha)
	}
	
	/**
	Return a custom color using r: 255, g: 51, b: 102
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom pink color.
	*/
	public class func WASPinkColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 255, g: 51, b: 102, a: alpha)
	}
	
	/**
	Return a custom color using r: 140, g: 136, b: 255
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom purple color.
	*/
	public class func WASPurpleColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 140, g: 136, b: 255, a: alpha)
	}
	
	/**
	Return a custom color using r: 238, g: 143, b: 110
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom orange color.
	*/
	public class func WASOrangeColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 238, g: 143, b: 110, a: alpha)
	}
	
	/**
	Return a custom color using r: 255, g: 255, b: 208
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom yellow color.
	*/
	public class func WASYellowColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 255, g: 246, b: 187, a: alpha)
	}
	
	/**
	Return a custom color using r: 242, g: 89, b: 75
	
	- parameter a: Alpha value. Default 1.0
	
	- returns: Custom red color.
	*/
	public class func WASRedColor(alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(r: 242, g: 89, b: 75, a: alpha)
	}
	
	/**
	Return a custom color using r:155, g: 155, b: 155, a: 0.2 to use in separators
	
	- parameter a: Alpha value. Default 0.2
	
	- returns: Custom pink color.
	*/
	public class func WASLineColor(alpha: CGFloat = 0.2) -> UIColor {
		return self.WASGray(216)
	}
	
}
