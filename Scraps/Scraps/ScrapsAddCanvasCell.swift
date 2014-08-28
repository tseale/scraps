//
//  ScrapsAddCanvasCell.swift
//  Scraps
//
//  Created by Taylor Seale on 6/28/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsAddCanvasCell: UICollectionViewCell {
	required init(coder: NSCoder) {fatalError("NSCoding not supported")}
	override init(frame: CGRect) {
		super.init(frame: CGRect())
		self.bounds.size = CGSizeMake(92,162)
		self.backgroundColor=BLUE_COLOR
		self.layer.cornerRadius=2
		
		self.layer.shadowOffset = CGSizeMake(0.0,-1.5)
		self.layer.shadowRadius = 1.5
		self.layer.shadowOpacity = 1.0
		self.layer.shadowColor = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00).CGColor
		
		let circle = UIView()
		circle.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
		circle.bounds.size = CGSizeMake(50, 50)
		circle.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)
		circle.layer.cornerRadius = circle.bounds.size.width/2
		self.addSubview(circle)
		
		let plusImage = UIImageView()
		plusImage.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
		plusImage.bounds.size = CGSizeMake(30, 30)
		plusImage.image = UIImage(named:"709-plus-gray@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		plusImage.tintColor = UIColor.lightGrayColor()
		self.addSubview(plusImage)
	}
}