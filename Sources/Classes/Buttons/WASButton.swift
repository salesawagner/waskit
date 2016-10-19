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
	
	case none
	case like
	case disLike
	case star
	case people
	case check
	
	public func imageName() -> String {
		var imageName = ""
		switch self {
		case .none:
			imageName = ""
		case .like:
			imageName = "WASIcn_like"
		case .disLike:
			imageName = "WASIcn_dislike"
		case .star:
			imageName = "WASIcn_star"
		case .people:
			imageName = "WASIcn_people"
		case .check:
			imageName = "WASIcn_check"
		}
		return imageName
	}
	
	func emoji() -> String {
		var imageName = ""
		switch self {
		case .none:
			imageName = ""
		case .like:
			imageName = "❤️"
		case .disLike:
			imageName = "❌"
		case .star:
			imageName = "⭐️"
		case .people:
			imageName = "👥"
		case .check:
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
	
	var type = WASButtonType.none
	
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
		super.init(frame:CGRect.zero)
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
			let image = UIImage(named: self.type.imageName(), in: Bundle(for: WASButton.self), compatibleWith: nil)
			self.setImage(image, for: UIControlState())

			self.setTitle("", for: .highlighted)
			self.setTitle("", for: .disabled)
			self.setTitle("", for: .selected)			
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
