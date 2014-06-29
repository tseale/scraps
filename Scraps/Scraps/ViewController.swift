//
//  ViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 6/23/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIViewControllerTransitioningDelegate {
	
	var SCREEN_HEIGHT: CGFloat = CGFloat()
	var SCREEN_WIDTH: CGFloat = CGFloat()
	
	var outerScrollView: UIScrollView = UIScrollView()
	
	let pullLeftToRevealStats = ScrapsPullMenuView(direction: "left", imageName: "859-bar-chart@2x.png")
	let pullRightToRevealOptions = ScrapsPullMenuView(direction: "right", imageName: "740-gear@2x.png")
	
	var collectionViewController = ScrapsCollectionViewController()
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// handle sizing and background color of collectionView
		self.view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)
		
		// constants just to store these oft-used values
		SCREEN_HEIGHT = self.view.frame.size.height
		SCREEN_WIDTH = self.view.frame.size.width
		
		// scrollview to allow for pull to side interactions
		outerScrollView = UIScrollView(frame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
		outerScrollView.alwaysBounceHorizontal = true
		outerScrollView.showsHorizontalScrollIndicator = false
		outerScrollView.showsVerticalScrollIndicator = false
		outerScrollView.directionalLockEnabled = true
		outerScrollView.delegate=self
		self.view.addSubview(outerScrollView)
		
		// create view controller for collection layout
		collectionViewController = ScrapsCollectionViewController(collectionViewLayout: ScrapsCollectionViewFlowLayout())
		collectionViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		// add the collection view controller to parent
		self.addChildViewController(collectionViewController)
		
		
		// add views for pull controls to outer scroll view
		pullLeftToRevealStats.center = CGPointMake(CGRectGetMaxX(outerScrollView.frame)+40, CGRectGetMidY(outerScrollView.frame)-pullLeftToRevealStats.bounds.size.height/2-20)
		outerScrollView.addSubview(pullLeftToRevealStats)
		
		pullRightToRevealOptions.center = CGPointMake(CGRectGetMinX(outerScrollView.frame)-40, CGRectGetMidY(outerScrollView.frame)-pullRightToRevealOptions.bounds.size.height/2-20)
		outerScrollView.addSubview(pullRightToRevealOptions)
		
		// add views to the parent view controller
		outerScrollView.addSubview(collectionViewController.view)
		self.view.addSubview(outerScrollView)
		
	}
	
	func scrollViewDidScroll(scrollView: UIScrollView!) {
		if scrollView.contentOffset.x<0 {
			pullRightToRevealOptions.progress = (-1*scrollView.contentOffset.x/90)
			if (pullRightToRevealOptions.progress<=1.1 && pullRightToRevealOptions.progress>=0.0) {
				pullRightToRevealOptions.updateProgressCircle()
			}
		}
		else if (scrollView.contentOffset.x>0) {
			pullLeftToRevealStats.progress = (scrollView.contentOffset.x/90)
			if (pullLeftToRevealStats.progress<=1.1 && pullLeftToRevealStats.progress>0.0) {
				pullLeftToRevealStats.updateProgressCircle()
			}
		}
	}
	
	func scrollViewDidEndDragging(scrollView: UIScrollView!, willDecelerate decelerate: Bool) {
		pullRightToRevealOptions.progress = (-1*scrollView.contentOffset.x/90)
		pullLeftToRevealStats.progress = (scrollView.contentOffset.x/90)
		pullRightToRevealOptions.updateProgressCircle()
		pullLeftToRevealStats.updateProgressCircle()
	}
	
}

