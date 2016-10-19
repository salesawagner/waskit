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

open class WASRoundedButton: UIButton {

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

	fileprivate func setup() {
	
		self.layer.cornerRadius = self.frame.size.width/2;
		self.adjustsImageWhenHighlighted = false;
		
		// Shadow
		self.layer.shadowColor		= UIColor.black.cgColor
		self.layer.shadowOpacity	= 0.5;
		self.layer.shadowRadius		= self.frame.size.width/15;
		self.layer.shadowOffset		= CGSize(width: 2.0, height: 2.0);
	}
	
	fileprivate func animation(_ zoom: Bool = false) {
		
		// Scale
		let fromScale: CGFloat	= self.transform.a
		let toScale: CGFloat	= zoom ? 0.9 : 1
		let scale				= CABasicAnimation(keyPath: "scale")
		scale.fromValue			= fromScale
		scale.toValue			= toScale
		self.transform			= CGAffineTransform(scaleX: toScale, y: toScale);
		
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
		color.fromValue			= fromColor?.cgColor
		color.toValue			= toColor?.cgColor
		self.backgroundColor	= toColor
		
		let both				= CAAnimationGroup()
		both.duration			= 0.25;
		both.animations			= [color,scale,shadow]
		both.timingFunction		= CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		
		self.layer.removeAllAnimations()
		self.layer.add(both, forKey: "buttonIn")
	}
	
	fileprivate func setDefaultBackground() {
		self.animation()
	}
	
	fileprivate func setHighlightedBackground() {
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
	
	override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.setHighlightedBackground()
		super.touchesBegan(touches, with: event)
	}
	
	override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.setDefaultBackground()
		super.touchesEnded(touches, with: event)
	}
	
}
