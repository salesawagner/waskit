//
//  ViewController.swift
//  WASKitDemo
//
//  Created by Wagner Sales on 4/26/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import WASKit

class ViewController: UIViewController {

	@IBOutlet weak var normalView: UIView!
	@IBOutlet weak var ligtherView: UIView!
	@IBOutlet weak var darkerView: UIView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.normalView.backgroundColor = UIColor(r: 127, g: 204, b: 204, a: 1.0)
		self.ligtherView.backgroundColor = self.normalView.backgroundColor!.WASLighterColor()
		self.darkerView.backgroundColor = self.normalView.backgroundColor!.WASDarkerColorColor()
	}
}

