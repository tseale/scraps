//
//  ScrapsCanvasCell.swift
//  Scraps
//
//  Created by Taylor Seale on 6/25/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsCanvasCell: UICollectionViewCell {
	init(frame: CGRect) {
		super.init(frame: CGRect())
		self.bounds.size = CGSizeMake(92,162)
		self.backgroundColor=UIColor.whiteColor()
		self.layer.cornerRadius=2
		self.layer.shadowOffset = CGSizeMake(0.0,1.5)
		self.layer.shadowRadius = 1.5
		self.layer.shadowOpacity = 1.0
		self.layer.shadowColor = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00).CGColor
	}
}
