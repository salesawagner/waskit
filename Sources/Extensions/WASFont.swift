//
//  WASFont.swift
//  WASKit
//
//  Created by Wagner Sales on 7/2/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//
//UIFont: family Avenir
//UIFont:   font Avenir-Heavy
//UIFont:   font Avenir-Oblique
//UIFont:   font Avenir-Black
//UIFont:   font Avenir-Book
//UIFont:   font Avenir-BlackOblique
//UIFont:   font Avenir-HeavyOblique
//UIFont:   font Avenir-Light
//UIFont:   font Avenir-MediumOblique
//UIFont:   font Avenir-Medium
//UIFont:   font Avenir-LightOblique
//UIFont:   font Avenir-Roman
//UIFont:   font Avenir-BookOblique

import UIKit

extension UIFont {
	
	public class func WASFontBook(size: CGFloat) -> UIFont {
		return UIFont(name: "Avenir-Book", size: size)!
	}
	
	public class func WASFontBlack(size: CGFloat) -> UIFont {
		return UIFont(name: "Avenir-Black", size: size)!
	}
}