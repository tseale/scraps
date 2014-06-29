//
//  ScrapsCollectionViewFlowLayout.swift
//  Scraps
//
//  Created by Taylor Seale on 6/25/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsCollectionViewFlowLayout: UICollectionViewFlowLayout {
	init() {
		super.init()
		self.itemSize = CGSizeMake(92, 162)
		self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
	}
}