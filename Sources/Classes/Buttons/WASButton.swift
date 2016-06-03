//
//  WASButton.swift
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

public enum WASButtonType: Int {
	
	case None
	case Like
	case DisLike
	case Star
	case People
	case Check
	
	public func imageName() -> String {
		var imageName = ""
		switch self {
		case .None:
			imageName = ""
		case .Like:
			imageName = "WASIcn_like"
		case .DisLike:
			imageName = "WASIcn_dislike"
		case .Star:
			imageName = "WASIcn_star"
		case .People:
			imageName = "WASIcn_people"
		case .Check:
			imageName = "WASIcn_check"
		}
		return imageName
	}
	
	func emoji() -> String {
		var imageName = ""
		switch self {
		case .None:
			imageName = ""
		case .Like:
			imageName = "❤️"
		case .DisLike:
			imageName = "❌"
		case .Star:
			imageName = "⭐️"
		case .People:
			imageName = "👥"
		case .Check:
			imageName = "✅"
		}
		return imageName
	}
}

//**********************************************************************************************************
//
// MARK: - Class -
//
//**********************************************************************************************************

@IBDesignable class WASButton: UIButton {
	
//**************************************************
// MARK: - Properties
//**************************************************
	
	var type = WASButtonType.None
	
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
	
	init(type: WASButtonType) {
		super.init(frame:CGRectZero)
		self.type = type
	}
	
//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Private Methods
//**************************************************
	
	func setup() {
		#if !TARGET_INTERFACE_BUILDER
			let image = UIImage(named: self.type.imageName(), inBundle: NSBundle(forClass: WASButton.self), compatibleWithTraitCollection: nil)
			self.setImage(image, forState: .Normal)

			self.setTitle("", forState: .Highlighted)
			self.setTitle("", forState: .Disabled)
			self.setTitle("", forState: .Selected)			
		#else
			self.setTitle(self.type.emoji(), forState: .Normal)
		#endif
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************

//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		self.setup()
	}
}