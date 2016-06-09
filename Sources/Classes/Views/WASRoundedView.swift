/*
 * IBM
 * Licensed Materials - Property of IBM
 * Copyright (C) 2015 IBM Corp. All Rights Reserved.
 * 6949 - XXX
 *
 * IMPORTANT:  This IBM software is supplied to you by IBM
 * Corp. ("IBM") in consideration of your agreement to the following
 * terms, and your use, installation, modification or redistribution of
 * this IBM software constitutes acceptance of these terms. If you do
 * not agree with these terms, please do not use, install, modify or
 * redistribute this IBM software.
 */

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

@IBDesignable class PARoundedView: UIView {
	
//**************************************************
// MARK: - Properties
//**************************************************
	
	@IBInspectable var cornerRadius: CGFloat = 10 {
		didSet {
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat = 0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		didSet {
			layer.borderColor = borderColor?.CGColor
		}
	}
	
	@IBInspectable var shadowColor: UIColor = UIColor.blackColor() {
		didSet {
			self.layer.shadowColor		= shadowColor.CGColor
			self.layer.shadowOpacity	= 1
			self.layer.shadowRadius		= 1
			self.layer.shadowOffset		= CGSizeMake(0, 2)
		}
	}
	
//**************************************************
// MARK: - Constructors
//**************************************************
	
	override init (frame : CGRect) {
		super.init(frame : frame)
		self.setup()
	}
	
	convenience init () {
		self.init(frame:CGRect.zero)
		self.setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}
	
//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Private Methods
//**************************************************

	private func setup() {
		
		self.cornerRadius = 4
		self.borderWidth = 1
		self.borderColor = UIColor.WASLineColor()
		self.shadowColor = UIColor.clearColor()
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************

	func alert() {
		
		self.borderColor = UIColor.redColor()
		self.borderWidth = 1
	}
	
	func clear() {
		
		self.borderColor = self.backgroundColor
		self.borderWidth = 0
	}
	
//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
}
