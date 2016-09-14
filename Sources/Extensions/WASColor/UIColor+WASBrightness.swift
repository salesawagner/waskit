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
	case WASbrightnessDarker
	case WASbrightnessLighter
}

//*************************
// MARK: Brightness
//*************************

extension UIColor {

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
	
}
