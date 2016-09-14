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
		
		
		let date = NSDate.WAScreate(year: 1984, month: 10, day: 8)!
		
		let pt_BR = NSLocale(localeIdentifier: "pt_BR")
		
		print(date)
		print("===================")
		print(date.toString())
		print(date.toLongString())
		print("===================")
		print(date.toString(locale: pt_BR))
		print(date.toLongString(locale: pt_BR))
		print("===================")
//		print(NSDate.create(year: 1984, month: 10, day: 08))
		
		
		print(WASKit.visibleView())
		
	}
	
	@IBAction func bla(sender: AnyObject) {
		self.pie.percent = 50
	}
}



