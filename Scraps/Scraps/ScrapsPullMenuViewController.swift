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
	
	var outerScrollView: UIScrollView = UIScrollView() // allows for pulling motion
	var innerViewController: UIViewController = UIViewController()
	var pullDirections: String = String() // which direction the controllers can be pulled in
	
	init(viewController: UIViewController, leftImage: String!, rightImage: String!) {
		super.init(coder: nil)
		innerViewController = viewController
	}
	
	override func viewDidLoad() {
		outerScrollView.frame = FULL_SCREEN
		outerScrollView.alwaysBounceHorizontal = true
		outerScrollView.showsHorizontalScrollIndicator = false
		outerScrollView.showsVerticalScrollIndicator = false
		outerScrollView.directionalLockEnabled = true
		outerScrollView.userInteractionEnabled = true
		outerScrollView.scrollEnabled = true
		outerScrollView.delegate=self
		outerScrollView.backgroundColor = UIColor.clearColor()
		
		innerViewController.view.frame = FULL_SCREEN
		outerScrollView.addSubview(innerViewController.view)
		self.view.addSubview(outerScrollView)
	}
}