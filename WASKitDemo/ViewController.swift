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

	var pie: WASPie!
	@IBOutlet weak var photoImageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		self.pie = WASPie(frame: CGRectMake(100,100,100,100))
		pie.percent = 55
//		pie.color = UIColor.WASPinkColor()
//		pie.percent = 25
//		pie.color = UIColor.WASGreenColor()
		self.view.addSubview(self.pie)
		
//		self.photoImageView.image = image?.resize(CGSizeMake(100, 100))
		
	}
	
	@IBAction func bla(sender: AnyObject) {
		self.pie.percent = 50
	}
}

