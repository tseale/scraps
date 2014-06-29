//
//  ScrapsCollectionViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 6/25/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

var canvasObjects: NSMutableArray = []

class ScrapsCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// placeholder data before implementing core data module
		for i in 1...10 {
			let placeholderCanvas = NSObject()
			canvasObjects.addObject(placeholderCanvas)
		}
		
		// eliminate background color of collection view
		self.collectionView.backgroundColor = UIColor.clearColor()
		
		// turn off scroll indicators, set locks and bounces
		self.collectionView.showsVerticalScrollIndicator = false
		self.collectionView.showsHorizontalScrollIndicator = false
		self.collectionView.directionalLockEnabled = true
		self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast
		
		// assign delegate and datasource
		self.collectionView.delegate=self
		self.collectionView.dataSource=self
		
		// register cell classes with the view (may be a cleaner way to reference class)
		self.collectionView.registerClass(ScrapsCanvasCell.self, forCellWithReuseIdentifier: "CanvasCell")
		self.collectionView.registerClass(ScrapsAddCanvasCell.self, forCellWithReuseIdentifier: "AddCanvasCell")
		
		self.collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "StatisticsView")
		
		// scroll all the way to the bottom
		// first compute the number of rows needed to scroll down, then set the y offset
		var numberOfRows: Int = (canvasObjects.count/3)
		if (canvasObjects.count%3) != 0 {numberOfRows++}
		let yOffset: CGFloat = CGFloat(numberOfRows*162)
		self.collectionView.contentOffset = CGPointMake(0, yOffset)
	}
	
	// create the cells for collection view
	override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
		return canvasObjects.count
	}
	
	override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
		if indexPath.row < (canvasObjects.count-1) {
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CanvasCell", forIndexPath: indexPath) as ScrapsCanvasCell
			return cell
		}else{
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AddCanvasCell", forIndexPath: indexPath) as ScrapsAddCanvasCell
			return cell
		}
		//cell.layer.shadowPath = [UIBezierPath bezierPathWithRect:viewCheck.bounds].CGPath;
	}
}