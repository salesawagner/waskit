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

@IBDesignable public class WASPie: UIView {

//**************************************************
// MARK: - Properties
//**************************************************

	private var circleShape: CAShapeLayer!
	private var percentLabel: UILabel!

	public var percent: CGFloat = 0 {
		didSet {
			self.drawPie()
		}
	}
	public var color: UIColor = UIColor.redColor() {
		didSet {
			self.drawPie()
		}
	}
	public var textColor: UIColor = UIColor.whiteColor() {
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

	private func setup() {
		
		self.circleShape = CAShapeLayer()
		self.circleShape.lineWidth = 1
		self.circleShape.fillColor = UIColor.clearColor().CGColor
		self.circleShape.strokeColor = self.color.CGColor
		self.layer.addSublayer(self.circleShape)
		
		if self.backgroundColor != UIColor.clearColor() {
			if let color = self.backgroundColor {
				self.color = color
			}
		}
		
		self.backgroundColor	= UIColor.clearColor()
//		self.layer.cornerRadius = self.frame.width/2
//		self.clipsToBounds		= true
		
		self.drawPie()
	}
	
	private func setupLabel() {
		
		if self.percentLabel != nil {
			self.percentLabel.removeFromSuperview()
			self.percentLabel = nil
		}
		
		let width = self.frame.size.width
		self.percentLabel = UILabel(frame: CGRectMake(0, 0, width, width))
		self.percentLabel.text = String(format: "%.0f", self.percent)
		self.percentLabel.textAlignment = .Center
		self.percentLabel.font = UIFont.boldSystemFontOfSize(width/2)
		self.percentLabel.textColor = self.textColor
		self.percentLabel.minimumScaleFactor = 0.2
		self.percentLabel.adjustsFontSizeToFitWidth = true
		self.addSubview(self.percentLabel)
	}
	
	private func drawPie() {
		
		let radius		= CGRectGetWidth(self.frame)/2
		let piePoint	= CGPointMake(radius, radius)
		let percent		= self.percent == 0 ? 100 : self.percent / 100
		let startAngle	= CGFloat(M_PI * 1.5)
		let endAngle	= (CGFloat((M_PI * 1.5) + (M_PI * 2)) - startAngle) * percent + startAngle

		let path = UIBezierPath(arcCenter: piePoint,
		                        radius: radius,
		                        startAngle: startAngle,
		                        endAngle: endAngle,
		                        clockwise: true)
		if self.percent == 0 {
			self.circleShape.fillColor = UIColor.clearColor().CGColor
		} else {
			path.addLineToPoint(piePoint)
			self.circleShape.fillColor = self.color.CGColor
		}
		
		path.closePath()
		
		self.circleShape.path = path.CGPath
		self.circleShape.strokeColor = self.color.CGColor
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
