//
//  ScrapsViewControllerPresentTransition.swift
//  Scraps
//
//  Created by Taylor Seale on 6/29/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsViewControllerPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
		return 0.6
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
		let presentingViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
		let overlayViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
		
		
		let containerView = transitionContext.containerView()
		containerView.addSubview(presentingViewController.view)
		containerView.addSubview(overlayViewController.view)
		
		overlayViewController.view.frame = CGRectMake(-UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)

		let transitionDuration = self.transitionDuration(transitionContext)
		
		UIView.animateWithDuration(transitionDuration/2,
											animations: {
												presentingViewController.view.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
											},
											completion: {
												(value: Bool) in
											})
		UIView.animateWithDuration(transitionDuration/2,
											delay: 0.3,
											options: nil,
											animations: {
												overlayViewController.view.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
											},
											completion: {
												(value: Bool) in
											})
	}
	
}