//
//  WASRoundedButton.swift
//  WASKit
//
//  Created by Wagner Sales on 6/28/16.
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

public class WASRoundedButton: UIButton {

//**************************************************
// MARK: - Properties
//**************************************************

	var colorNormal: UIColor? {
		willSet(newValue) {
			self.colorHighlighted = newValue?.WASDarkerColor()
		}
	}
	var colorHighlighted: UIColor?
	
//**************************************************
// MARK: - Constructors
//**************************************************

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setup()
	}
	
	convenience init() {
		self.init(frame:CGRect.zero)
		self.setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}
	
//**************************************************
// MARK: - Private Methods
//**************************************************

	private func setup() {
	
		self.layer.cornerRadius = self.frame.size.width/2;
		self.adjustsImageWhenHighlighted = false;
		
		// Shadow
		self.layer.shadowColor		= UIColor.blackColor().CGColor
		self.layer.shadowOpacity	= 0.5;
		self.layer.shadowRadius		= self.frame.size.width/15;
		self.layer.shadowOffset		= CGSizeMake(2.0, 2.0);
	}
	
	private func animation(zoom: Bool = false) {
		
		// Scale
		let fromScale: CGFloat	= self.transform.a
		let toScale: CGFloat	= zoom ? 0.9 : 1
		let scale				= CABasicAnimation(keyPath: "scale")
		scale.fromValue			= fromScale
		scale.toValue			= toScale
		self.transform			= CGAffineTransformMakeScale(toScale, toScale);
		
		// Shadow
		let fromShadow			= self.layer.shadowRadius
		let toShadow			= zoom ? 1 : self.frame.size.width * 0.1
		let shadow				= CABasicAnimation(keyPath: "shadow")
		shadow.fromValue		= fromShadow
		shadow.toValue			= toShadow
		self.layer.shadowRadius = toShadow;
		
		// Color
		let fromColor			= self.backgroundColor
		let toColor				= zoom ? self.colorHighlighted : self.colorNormal
		let color				= CABasicAnimation(keyPath: "background")
		color.fromValue			= fromColor?.CGColor
		color.toValue			= toColor?.CGColor
		self.backgroundColor	= toColor
		
		let both				= CAAnimationGroup()
		both.duration			= 0.25;
		both.animations			= [color,scale,shadow]
		both.timingFunction		= CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		
		self.layer.removeAllAnimations()
		self.layer.addAnimation(both, forKey: "buttonIn")
	}
	
	private func setDefaultBackground() {
		self.animation()
	}
	
	private func setHighlightedBackground() {
		self.colorNormal		= self.backgroundColor
		self.colorHighlighted	= self.backgroundColor?.WASDarkerColor()
		self.animation(true)
	}

//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Public Methods
//**************************************************

//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
	override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.setHighlightedBackground()
		super.touchesBegan(touches, withEvent: event)
	}
	
	override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.setDefaultBackground()
		super.touchesEnded(touches, withEvent: event)
	}
	
}
