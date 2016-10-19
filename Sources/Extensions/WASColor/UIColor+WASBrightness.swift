//
//  UIColor+WASBrightness.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**********************************************************************************************************
//
// MARK: - Definitions -
//
//**********************************************************************************************************

private enum WASBrightnessType: Int {
	case waSbrightnessDarker
	case waSbrightnessLighter
}

//*************************
// MARK: Brightness
//*************************

extension UIColor {

//**************************************************
// MARK: - Private Methods
//**************************************************
	
	fileprivate func brightness(_ brightnessType: WASBrightnessType) -> UIColor {
		
		var h: CGFloat = 0
		var s: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		
		var finishColor: UIColor = self
		
		if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
			
			var brightness = b
			if brightnessType == .waSbrightnessLighter {
				brightness = min((b * 1.3), 1.0)
			} else if brightnessType == .waSbrightnessDarker {
				brightness = (b * 0.75)
			}
			
			finishColor = UIColor(hue: h, saturation: s, brightness: brightness, alpha: a)
		}
		
		return finishColor
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************
	
	/**
	Return a lighter color using the brightness.
	
	- returns: Lighter color.
	*/
	public func WASLighterColor() -> UIColor {
		return self.brightness(.waSbrightnessLighter)
	}
	
	/**
	Return a darker color using the brightness.
	
	- returns: Darker color.
	*/
	public func WASDarkerColor() -> UIColor {
		return self.brightness(.waSbrightnessDarker)
	}
	
}
