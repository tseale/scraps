//
//  ScrapsPullMenuView.swift
//  Scraps
//
//  Created by Taylor Seale on 6/27/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class ScrapsPullMenuView: UIView {
	
	let image: UIImageView = UIImageView()
	var direction: String = String()
	
	let progressCircleLayer: CAShapeLayer = CAShapeLayer()
	let clockWiseProgress: Bool = Bool()
	var	endAngle: CGFloat = CGFloat()
	
	var popped: Bool = Bool()
	
	var progress: CGFloat = 1.0
	
	init (direction: String, imageName: String) {
		super.init(frame: CGRect())
		switch direction {
			case "left":
				clockWiseProgress=false
				endAngle = -5*M_PI/2
			case "right":
				clockWiseProgress=true
				endAngle = 3*M_PI/2
			default:
				println("ERROR: MUST SUPPLY DIRECTION")
				clockWiseProgress=true
		}
		
		popped=false
		
		// create the image object and size the image view based on the image dimensions
		let elementImage = UIImage(named:imageName).imageWithRenderingMode(.AlwaysTemplate)

		// size the view based on image dimensions
		self.bounds.size = CGSizeMake(elementImage.size.width, elementImage.size.height)
		image = UIImageView()
		image.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
		image.bounds.size = CGSizeMake(elementImage.size.width,elementImage.size.height)
		image.image = elementImage
		image.tintColor = UIColor.lightGrayColor()
		
		// set up pull progress circle element
		let progressCircleCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
		let progressCircleRadius = 25.0;
		let progressCirclePath = UIBezierPath(arcCenter:progressCircleCenter,
												 radius:progressCircleRadius,
											 startAngle:-M_PI/2,
											   endAngle:endAngle,
											  clockwise:clockWiseProgress)
		// configure the layer that will display the progress circle element
		progressCircleLayer.strokeStart=0.0
		progressCircleLayer.strokeEnd=1.0
		progressCircleLayer.path = progressCirclePath.CGPath
		progressCircleLayer.strokeColor = UIColor.lightGrayColor().CGColor
		progressCircleLayer.fillColor = UIColor.clearColor().CGColor
		progressCircleLayer.lineWidth = 1.0
		self.layer.addSublayer(progressCircleLayer)
		
		self.addSubview(image)
	}
	
	func updateProgressCircle() {
		progressCircleLayer.strokeEnd = progress
		if progress>=1.0 {
			progressCircleLayer.fillColor = UIColor(red:0.20, green:0.67, blue:0.86, alpha:1.00).CGColor
			progressCircleLayer.strokeColor = UIColor(red:0.20, green:0.67, blue:0.86, alpha:1.00).CGColor
			image.tintColor = UIColor.whiteColor()
			if !popped {
				popped=true
				popCircle()
			}
		}else{
			progressCircleLayer.strokeColor = UIColor.lightGrayColor().CGColor
			progressCircleLayer.fillColor = UIColor.clearColor().CGColor
			image.tintColor = UIColor.lightGrayColor()
			if popped {
				popped=false
				popCircle()
			}
		}
	}
	
	func popCircle() {
		self.transform = CGAffineTransformMakeScale(1, 1);
		UIView.animateWithDuration(0.3/3,
							animations: {
								self.transform = CGAffineTransformMakeScale(1.2, 1.2)
							}, completion: {
									(value: Bool) in
										UIView.animateWithDuration(0.3/3,
														animations: {
															self.transform = CGAffineTransformMakeScale(0.9, 0.9)
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