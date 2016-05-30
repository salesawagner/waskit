//
//  WASButton.swift
//  WASKit
//
//  Created by Wagner Sales on 5/30/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIButton {
	
	class func likeButton() -> UIButton {
	
		let image = UIImage(named: "WASIcn_like")
		let button = UIButton()
		button.setImage(image, forState: .Normal)
		
		return button
	}
}