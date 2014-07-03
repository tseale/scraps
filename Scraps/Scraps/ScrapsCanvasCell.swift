//
//  ScrapsCanvasCell.swift
//  Scraps
//
//  Created by Taylor Seale on 6/25/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ScrapsCanvasCell: UICollectionViewCell {
	
	var borderPath = UIBezierPath()
	let border: CAShapeLayer = CAShapeLayer()
	
	var showOptions: Bool = false
	
	init(frame: CGRect) {
		super.init(frame: CGRect())
		self.bounds.size = CGSizeMake(92,162)
		self.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
		self.backgroundColor=UIColor.whiteColor()
		self.layer.cornerRadius=2
		self.layer.shadowOffset = CGSizeMake(0.0,1.5)
		self.layer.shadowRadius = 1.5
		self.layer.shadowOpacity = 1.0
		self.layer.shadowColor = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00).CGColor
		
		borderPath = UIBezierPath(rect: self.layer.frame)
		border.strokeStart = 0.0
		border.strokeEnd = 1.0
		border.path = borderPath.CGPath
		border.strokeColor = UIColor(red:0.20, green:0.67, blue:0.86, alpha:1.00).CGColor
		border.fillColor = UIColor.clearColor().CGColor
		border.lineWidth = 2.0
	}
	
	func increaseProgress() {
		self.layer.addSublayer(border)
		popCanvas()
		showOptions=true
	}
	
	func reduceProgress() {
		border.removeFromSuperlayer()
		if showOptions {self.popCanvas()}
		showOptions = false
	}
	
	func popCanvas() {
		self.transform = CGAffineTransformMakeScale(1, 1);
		UIView.animateWithDuration(0.3/3,
			animations: {
				self.transform = CGAffineTransformMakeScale(1.05, 1.05)
			}, completion: {
				(value: Bool) in
				UIView.animateWithDuration(0.3/3,
					animations: {
						self.transform = CGAffineTransformMakeScale(0.95, 0.95)
					}, completion: {
						(value: Bool) in
						UIView.animateWithDuration(0.3/3,
							animations: {
								self.transform = CGAffineTransformMakeScale(1.0, 1.0)
							}, completion: {
								(value: Bool) in
								
							})
					})
			})
	}
}
