//
//  WASPie.swift
//  WASKit
//
//  Created by Wagner Sales on 7/2/16.
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

@IBDesignable open class WASPie: UIView {

//**************************************************
// MARK: - Properties
//**************************************************

	fileprivate var circleShape: CAShapeLayer!
	fileprivate var percentLabel: UILabel!

	open var percent: CGFloat = 0 {
		didSet {
			self.drawPie()
		}
	}
	open var color: UIColor = UIColor.red {
		didSet {
			self.drawPie()
		}
	}
	open var textColor: UIColor = UIColor.white {
		didSet {
			self.drawPie()
		}
	}
	open var title: String? {
		didSet {
			self.drawPie()
		}
	}
	
//**************************************************
// MARK: - Constructors
//**************************************************

	override public init(frame : CGRect) {
		super.init(frame: frame)
		self.setup()
	}
	
	convenience init() {
		self.init(frame: CGRect.zero)
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
		
		self.circleShape = CAShapeLayer()
		self.circleShape.lineWidth = 1
		self.circleShape.fillColor = UIColor.clear.cgColor
		self.circleShape.strokeColor = self.color.cgColor
		self.layer.addSublayer(self.circleShape)
		
		if self.backgroundColor != UIColor.clear {
			if let color = self.backgroundColor {
				self.color = color
			}
		}
		
		self.backgroundColor	= UIColor.clear
//		self.layer.cornerRadius = self.frame.width/2
//		self.clipsToBounds		= true
		
		self.drawPie()
	}
	
	fileprivate func setupLabel() {
		
		if self.percentLabel != nil {
			self.percentLabel.removeFromSuperview()
			self.percentLabel = nil
		}
		
		let width = self.frame.size.width
		self.percentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
		self.percentLabel.textAlignment = .center
		self.percentLabel.font = UIFont.boldSystemFont(ofSize: width/2.5)
		self.percentLabel.minimumScaleFactor = 0.2
		self.percentLabel.adjustsFontSizeToFitWidth = true
		self.percentLabel.textColor = self.textColor
		
		var pieTitle = String(format: "%.0f", self.percent)
		if let title = self.title {
			pieTitle = title
		}
		self.percentLabel.text = pieTitle
		
		self.addSubview(self.percentLabel)
	}
	
	fileprivate func drawPie() {
		
		let radius		= self.frame.width/2
		let piePoint	= CGPoint(x: radius, y: radius)
		let percent		= self.percent == 0 ? 100 : self.percent / 100
		let startAngle	= CGFloat(M_PI * 1.5)
		let endAngle	= (CGFloat((M_PI * 1.5) + (M_PI * 2)) - startAngle) * percent + startAngle

		let path = UIBezierPath(arcCenter: piePoint,
		                        radius: radius,
		                        startAngle: startAngle,
		                        endAngle: endAngle,
		                        clockwise: true)
		if self.percent == 0 {
			self.circleShape.fillColor = UIColor.clear.cgColor
		} else {
			path.addLine(to: piePoint)
			self.circleShape.fillColor = self.color.cgColor
		}
		
		path.close()
		
		self.circleShape.path = path.cgPath
		self.circleShape.strokeColor = self.color.cgColor
		self.setupLabel()
	}
	
//**************************************************
// MARK: - Internal Methods
//**************************************************

//**************************************************
// MARK: - Public Methods
//**************************************************

//**************************************************
// MARK: - Override Public Methods
//**************************************************
	
}
