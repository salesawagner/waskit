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

	@IBOutlet weak var photoImageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
//		self.photoImageView.image = image?.resize(CGSizeMake(100, 100))
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.photoImageView.clipsToBounds = true
		let image = self.photoImageView.image
		
		self.photoImageView.image = image?.crop(CGRectMake(500, 0, CGRectGetWidth(self.photoImageView.frame), CGRectGetHeight(self.photoImageView.frame)))
	}
}

