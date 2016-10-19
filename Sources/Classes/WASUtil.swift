//
//  WASUtil.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

open class WASKit: NSObject {

	//*************************
	// MARK: ViewControllers
	//*************************
	
	/**
	Get the visible view controller.
	
	- returns: The visible view controller optional.
	*/
	static open func visibleView() -> UIViewController? {
		var viewController: UIViewController!
		if let delegate = UIApplication.shared.delegate {
			if let window = delegate.window {
				viewController = window!.visibleViewController
			}
		}
		return viewController
	}
	
}
