//
//  ViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 6/23/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
	
	var outerScrollView: UIScrollView = UIScrollView()
	
	var optionsViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsOptionsViewController(), leftImage: nil, rightImage: nil)
	var collectionViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsCollectionViewController(collectionViewLayout: ScrapsCollectionViewFlowLayout()), leftImage: nil, rightImage: nil)
	var statsViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsStatsViewController(), leftImage: nil, rightImage: nil)
	
	override func viewDidLoad() {
		outerScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		outerScrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, SCREEN_HEIGHT)
		outerScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
		outerScrollView.alwaysBounceHorizontal = false
		outerScrollView.scrollEnabled = false
		outerScrollView.pagingEnabled = true
		
		optionsViewController.view.frame.origin = CGPointMake(0, 0)
		collectionViewController.view.frame.origin = CGPointMake(SCREEN_WIDTH, 0)
		statsViewController.view.frame.origin = CGPointMake(2*SCREEN_WIDTH, 0)
		outerScrollView.addSubview(optionsViewController.view)
		outerScrollView.addSubview(collectionViewController.view)
		outerScrollView.addSubview(statsViewController.view)
		self.view.addSubview(outerScrollView)
	}
	
	/*
	//let pullLeftToRevealStats = ScrapsPullMenuView(direction: "left", imageName: "859-bar-chart@2x.png")
	//let pullRightToRevealOptions = ScrapsPullMenuView(direction: "right", imageName: "740-gear@2x.png")
	
	// create view controllers for necessary views
	var optionsViewController = ScrapsOptionsViewController()
	var collectionViewController = ScrapsCollectionViewController()
	var statsViewController = ScrapsStatsViewController()
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// handle sizing and background color of collectionView
		self.view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.00)

		
		// scrollview to allow for pull to side interactions
		outerScrollView = UIScrollView(frame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
		outerScrollView.alwaysBounceHorizontal = true
		outerScrollView.showsHorizontalScrollIndicator = false
		outerScrollView.showsVerticalScrollIndicator = false
		outerScrollView.directionalLockEnabled = true
		outerScrollView.delegate=self
		self.view.addSubview(outerScrollView)
		
		optionsViewController = ScrapsOptionsViewController()
		optionsViewController.transitioningDelegate = self
		optionsViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
		
		// create view controller for collection layout
		collectionViewController = ScrapsCollectionViewController(collectionViewLayout: ScrapsCollectionViewFlowLayout())
		collectionViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		
		statsViewController = ScrapsStatsViewController()
		
		// add the view controllers to parent
		//self.addChildViewController(optionsViewController)
		//self.addChildViewController(collectionViewController)
		//self.addChildViewController(statsViewController)
		
		
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
		if (pullRightToRevealOptions.progress>=1.0) {
			let screenshot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
			self.view.addSubview(screenshot)
			self.presentViewController(optionsViewController, animated: true, completion: nil)
		}
		if (pullLeftToRevealStats.progress>=1.0) {
			self.presentViewController(statsViewController, animated: true, completion: nil)
		}
		pullRightToRevealOptions.progress = (-1*scrollView.contentOffset.x/90)
		pullLeftToRevealStats.progress = (scrollView.contentOffset.x/90)
		pullRightToRevealOptions.updateProgressCircle()
		pullLeftToRevealStats.updateProgressCircle()
	}
	
	func animationControllerForPresentedController(presented: UIViewController!,
		presentingController presenting: UIViewController!,
		sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
				return ScrapsViewControllerPresentTransition()
	}
	
	func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
		return ScrapsViewControllerPresentTransition()
	}
	*/
}

