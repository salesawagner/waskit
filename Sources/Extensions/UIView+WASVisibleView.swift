//
//  UIView+WASVisibleView.swift
//  WASKit
//
//  Created by Wagner Sales on 9/14/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIWindow {
	
//**************************************************
// MARK: - Private Methods
//**************************************************

	fileprivate static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
		if let nc = vc as? UINavigationController {
			return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
		} else if let tc = vc as? UITabBarController {
			return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
		} else {
			if let pvc = vc?.presentedViewController {
				return UIWindow.getVisibleViewControllerFrom(pvc)
			} else {
				return vc
			}
		}
	}
	
//**************************************************
// MARK: - Public Methods
//**************************************************

	public var visibleViewController: UIViewController? {
		return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
	}
}


