//
//  ScrapsPullMenuViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 6/30/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsPullMenuViewController: UIViewController, UIScrollViewDelegate {
	required init(coder: NSCoder) {fatalError("NSCoding not supported")}
	
	var pullScrollView = UIScrollView()
	
	var innerViewController = UIViewController()
	
	var leftPullOption = ScrapsPullMenuView(direction: "left")
	var rightPullOption = ScrapsPullMenuView(direction: "right")
	
	var screenShot = UIView()
	
	init(viewController: UIViewController, leftImage: String!, rightImage: String!) {
		super.init(coder: nil)
		innerViewController = viewController
		if leftImage {leftPullOption.addImage(leftImage)}
		if rightImage {rightPullOption.addImage(rightImage)}
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "enableScrolling", name: "enableScroll", object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "disableScrolling", name: "disableScroll", object: nil)
	}
	
	override func viewDidLoad() {
		pullScrollView.frame = FULL_SCREEN
		pullScrollView.alwaysBounceHorizontal = true
		pullScrollView.showsHorizontalScrollIndicator = false
		pullScrollView.showsVerticalScrollIndicator = false
		pullScrollView.directionalLockEnabled = true
		pullScrollView.userInteractionEnabled = true
		pullScrollView.scrollEnabled = true
		pullScrollView.delegate=self
		pullScrollView.backgroundColor = UIColor.clearColor()
		
		leftPullOption.center = CGPointMake(CGRectGetMaxX(pullScrollView.frame)+40, CGRectGetMidY(pullScrollView.frame)-leftPullOption.bounds.size.height/2-15)
		pullScrollView.addSubview(leftPullOption)
		
		rightPullOption.center = CGPointMake(CGRectGetMinX(pullScrollView.frame)-40, CGRectGetMidY(pullScrollView.frame)-rightPullOption.bounds.size.height/2-15)
		pullScrollView.addSubview(rightPullOption)
		
		innerViewController.view.frame = FULL_SCREEN
		pullScrollView.addSubview(innerViewController.view)
		self.view.addSubview(pullScrollView)
	}
	
	func scrollViewDidScroll(scrollView: UIScrollView!) {
		if scrollView.contentOffset.x<0 {
			rightPullOption.progress = (-1*scrollView.contentOffset.x/90)
			if (rightPullOption.progress<=1.1 && rightPullOption.progress>=0.0) {
				rightPullOption.updateProgressCircle()
			}
		}
		
		if scrollView.contentOffset.x>0 {
			leftPullOption.progress = (scrollView.contentOffset.x/90)
			if (leftPullOption.progress<=1.1 && leftPullOption.progress>0.0) {
				leftPullOption.updateProgressCircle()
			}
		}
	}
	
	func scrollViewDidEndDragging(scrollView: UIScrollView!, willDecelerate decelerate: Bool) {
		if rightPullOption.created && rightPullOption.progress>=1.0{
			screenShot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
			self.view.addSubview(screenShot)
			NSNotificationCenter.defaultCenter().postNotificationName("shiftRight", object: nil)
			self.performClosureAfterDelay(1, block: {
				self.screenShot.removeFromSuperview()
			})
		}
		if leftPullOption.created && leftPullOption.progress>=1.0 {
			screenShot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
			self.view.addSubview(screenShot)
			NSNotificationCenter.defaultCenter().postNotificationName("shiftLeft", object: nil)
			self.performClosureAfterDelay(1, block: {
				self.screenShot.removeFromSuperview()
			})
		}
		rightPullOption.progress = (-1*scrollView.contentOffset.x/90)
		leftPullOption.progress = (scrollView.contentOffset.x/90)
		rightPullOption.updateProgressCircle()
		leftPullOption.updateProgressCircle()
	}
	
	func disableScrolling() {
		pullScrollView.scrollEnabled = false
	}
	
	func enableScrolling() {
		pullScrollView.scrollEnabled = true
	}
	
}