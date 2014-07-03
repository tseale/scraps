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
	
	var optionsViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsOptionsViewController(), leftImage: "859-bar-chart@2x.png", rightImage:  nil)
	var collectionViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsCollectionViewController(collectionViewLayout: ScrapsCollectionViewFlowLayout()), leftImage: "859-bar-chart@2x.png", rightImage: "740-gear@2x.png")
	var statsViewController: ScrapsPullMenuViewController = ScrapsPullMenuViewController(viewController: ScrapsStatsViewController(), leftImage: nil, rightImage: "859-bar-chart@2x.png")
	
	override func viewDidLoad() {
		outerScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		outerScrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, SCREEN_HEIGHT)
		outerScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0)
		outerScrollView.alwaysBounceHorizontal = false
		outerScrollView.scrollEnabled = false
		
		optionsViewController.view.frame.origin = CGPointMake(0, 0)
		collectionViewController.view.frame.origin = CGPointMake(SCREEN_WIDTH, 0)
		statsViewController.view.frame.origin = CGPointMake(2*SCREEN_WIDTH, 0)
		outerScrollView.addSubview(optionsViewController.view)
		outerScrollView.addSubview(collectionViewController.view)
		outerScrollView.addSubview(statsViewController.view)
		self.view.addSubview(outerScrollView)
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "shiftRight", name: "shiftRight", object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "shiftLeft", name: "shiftLeft", object: nil)
	}
	
	func shiftRight() {
		var newScrollViewPosition = outerScrollView.contentOffset
		newScrollViewPosition.x -= SCREEN_WIDTH
		outerScrollView.setContentOffset(newScrollViewPosition, animated: true)
	}
	
	func shiftLeft() {
		var newScrollViewPosition = outerScrollView.contentOffset
		newScrollViewPosition.x += SCREEN_WIDTH
		outerScrollView.setContentOffset(newScrollViewPosition, animated: true)
	}
}

