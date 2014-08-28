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
	
	var originalLayout: ScrapsCollectionViewFlowLayout = ScrapsCollectionViewFlowLayout()
	var expandedLayout: ScrapsCollectionViewFlowLayout = ScrapsCollectionViewFlowLayout()
	
	var selectionMode: Bool = false
	var selectedCells: NSMutableArray = []
	
	var collectionSelectionMenu: ScrapsOptionsMenuView = ScrapsOptionsMenuView()
	
	var addCanvasButton: UIButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// placeholder data before implementing core data module
		for i in 1...12 {
			let placeholderCanvas = NSObject()
			canvasObjects.addObject(placeholderCanvas)
		}
		
		// eliminate background color of collection view
		self.collectionView.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)
		
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
		
		self.collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Empty Space")
		
		// scroll all the way to the bottom
		// first compute the number of rows needed to scroll down, then set the y offset
		var numberOfRows: Int = (canvasObjects.count/3)
		if (canvasObjects.count%3) != 0 {numberOfRows++}
		let yOffset: CGFloat = CGFloat(numberOfRows*162)
		self.collectionView.contentOffset = CGPointMake(0, yOffset)
		
		addCanvasButton.frame = CGRectMake(CGRectGetMidX(self.view.frame)-30, CGRectGetMaxY(self.view.frame)-70, 60, 60)
		addCanvasButton.layer.cornerRadius = addCanvasButton.frame.size.width/2
		addCanvasButton.layer.shadowOffset = CGSizeMake(0.0,1.5)
		addCanvasButton.layer.shadowRadius = 1.5
		addCanvasButton.layer.shadowOpacity = 1.0
		addCanvasButton.layer.shadowColor = UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.00).CGColor
		addCanvasButton.backgroundColor = BLUE_COLOR
		let plusImage = UIImageView()
		plusImage.center = CGPointMake(CGRectGetMidX(addCanvasButton.bounds), CGRectGetMidY(addCanvasButton.bounds))
		plusImage.bounds.size = CGSizeMake(30, 30)
		plusImage.image = UIImage(named:"709-plus-gray@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		plusImage.tintColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)
		addCanvasButton.addSubview(plusImage)
		self.view.addSubview(addCanvasButton)
		
		collectionSelectionMenu.setFrame(CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 100))
		self.view.addSubview(collectionSelectionMenu)
	}
	
	// create the cells for collection view
	override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
		return canvasObjects.count
	}
	
	override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
			let canvasCellLongPress = UILongPressGestureRecognizer(target: self, action: "canvasCellLongPress:")
			canvasCellLongPress.minimumPressDuration = 0.3
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CanvasCell", forIndexPath: indexPath) as ScrapsCanvasCell
			cell.addGestureRecognizer(canvasCellLongPress)
			return cell
	}
	
	func canvasCellLongPress(recognizer: UILongPressGestureRecognizer) {
		let cell: ScrapsCanvasCell = recognizer.view as ScrapsCanvasCell
			switch recognizer.state {
			case .Began:
				if cell.isSelected {
					cell.makeUnSelected()
					selectedCells.removeObject(cell)
					if (selectedCells.count==0){
						selectionMode = false
						UIView.animateWithDuration(0.3,
							delay: 0.0,
							options: nil,
							animations: {
								self.collectionSelectionMenu.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 100)
								NSNotificationCenter.defaultCenter().postNotificationName("enableScroll", object: nil)
							},
							completion: {
								(value: Bool) in
								self.collectionView.setCollectionViewLayout(self.originalLayout, animated: false)
							})
					}
				}else{
					if !selectionMode {
						UIView.animateWithDuration(0.3,
							delay: 0.0,
							options: nil,
							animations: {
								self.collectionSelectionMenu.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100)
								NSNotificationCenter.defaultCenter().postNotificationName("disableScroll", object: nil)
							},
							completion: {
								(value: Bool) in
								self.collectionView.setCollectionViewLayout(self.expandedLayout, animated: false)
							})
					}
					cell.makeSelected()
					selectedCells.addObject(cell)
				}
			case .Ended:
				if !selectionMode {
					selectionMode = true
				}
			default:
				let cell: ScrapsCanvasCell = recognizer.view as ScrapsCanvasCell
			}
	}
	
	override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
		let cell: ScrapsCanvasCell = collectionView.cellForItemAtIndexPath(indexPath) as ScrapsCanvasCell
		if selectionMode {
			if cell.isSelected {
				cell.makeUnSelected()
				selectedCells.removeObject(cell)
				if (selectedCells.count==0){
					selectionMode = false
					UIView.animateWithDuration(0.3,
						delay: 0.0,
						options: nil,
						animations: {
							self.collectionSelectionMenu.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 100)
							NSNotificationCenter.defaultCenter().postNotificationName("enableScroll", object: nil)
						},
						completion: {
							(value: Bool) in
							self.collectionView.setCollectionViewLayout(self.originalLayout, animated: false)
						})
				}
			}else{
				cell.makeSelected()
				selectedCells.addObject(cell)
			}
		}else{
			/*
			let canvasViewController: ScrapsCanvasViewController = ScrapsCanvasViewController()
			self.addChildViewController(canvasViewController)
			canvasViewController.canvasPreview = UIView(frame: self.collectionView.convertRect(cell.frame, toView: self.view))
			self.view.addSubview(canvasViewController.view)
			canvasViewController.transitionIntoEditView()
			*/
		}
	}
}