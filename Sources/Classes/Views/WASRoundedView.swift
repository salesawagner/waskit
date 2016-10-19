//
//  WASRoundedView.swift
//  WASKit
//
//  Created by Wagner Sales on 5/30/16.
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

@IBDesignable open class WASRoundedView: UIView {
	
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
			layer.borderColor = borderColor?.cgColor
		}
	}
	
	@IBInspectable var shadowColor: UIColor = UIColor.black {
		didSet {
			self.layer.shadowColor		= shadowColor.cgColor
			self.layer.shadowOpacity	= 1
			self.layer.shadowRadius		= 1
			self.layer.shadowOffset		= CGSize(width: 0, height: 2)
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
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}

//**************************************************
// MARK: - Private Methods
//**************************************************
	
	fileprivate func setup() {
		self.cornerRadius = 4
		self.borderWidth = 1
		self.borderColor = UIColor.WASLineColor()
		self.shadowColor = UIColor.clear
	}
	
//**************************************************
// MARK: - Internal Methods
//**************************************************
	
//**************************************************
// MARK: - Public Methods
//**************************************************

	open func alert() {
		
		self.borderColor = UIColor.red
		self.borderWidth = 1
	}
	
	open func clear() {
		
		self.borderColor = self.backgroundColor
		self.borderWidth = 0
	}
	
//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
}
