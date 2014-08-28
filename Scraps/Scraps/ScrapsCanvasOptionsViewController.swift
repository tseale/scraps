//
//  ScrapsCanvasOptionsViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 7/4/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsCanvasOptionsViewController: UIViewController {
	
	// view to just blur the background for higher contrast
	var blurredBackground: UIVisualEffectView = UIVisualEffectView(effect:UIBlurEffect(style:.Light))
	
	// view representing the canvas
	var canvasPreview: UIView = UIView()
	
	// drop zones for actions to commit on a canvas
	var messageDropZone: UIView = UIView()
	var deleteDropZone: UIView = UIView()
	
	// remember the original position of the canvas on the super view
	var originalFrame: CGRect = CGRect()
	
	override func viewDidLoad() {
		self.view.frame = FULL_SCREEN
		
		// set up the blurred background
		blurredBackground.frame = FULL_SCREEN
		blurredBackground.alpha = 0.0
		blurredBackground.tintColor = UIColor.redColor()
		self.view.addSubview(blurredBackground)
		
		canvasPreview.backgroundColor = UIColor.whiteColor()
		canvasPreview.layer.cornerRadius = 2
		canvasPreview.userInteractionEnabled = true
		
		messageDropZone.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.00)
		messageDropZone.frame.size = CGSizeMake(70, 70)
		messageDropZone.layer.cornerRadius = messageDropZone.frame.size.width/2
		messageDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), -1*messageDropZone.frame.size.height)
		let messageImage = UIImageView()
		let messageDropZoneImage = UIImage(named:"734-chat@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		messageImage.center = CGPointMake(messageDropZone.frame.size.width/2, messageDropZone.frame.size.height/2)
		messageImage.bounds.size = CGSizeMake(messageDropZoneImage.size.width,messageDropZoneImage.size.height)
		messageImage.image = messageDropZoneImage
		messageImage.tintColor = UIColor.whiteColor()
		messageDropZone.addSubview(messageImage)
		self.view.addSubview(messageDropZone)
		
		deleteDropZone.backgroundColor = UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.00)
		deleteDropZone.frame.size = CGSizeMake(70, 70)
		deleteDropZone.layer.cornerRadius = deleteDropZone.frame.size.width/2
		deleteDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), SCREEN_HEIGHT+deleteDropZone.frame.size.height)
		self.view.addSubview(deleteDropZone)
	}
	
	func setCanvasPreviewOriginalFrame(view: UIView) {
		originalFrame = view.frame
		canvasPreview.frame = view.frame
		self.view.addSubview(canvasPreview)
	}
	
	func transitionIntoView() {
		UIView.animateWithDuration(0.3,
			delay: 0.0,
			options: nil,
			animations: {
				self.blurredBackground.alpha = 1.0
				self.messageDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), self.messageDropZone.frame.size.height/2+10)
				self.deleteDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), SCREEN_HEIGHT-self.deleteDropZone.frame.size.height/2-10)
			},
			completion: {(value: Bool) in})
	}
	
	func transitionOutOfView() {
		UIView.animateWithDuration(0.3,
			delay: 0.0,
			options: nil,
			animations: {
				self.blurredBackground.alpha = 0.0
				self.messageDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), -1*self.messageDropZone.frame.size.height)
				self.deleteDropZone.center = CGPointMake(CGRectGetMidX(self.view.frame), SCREEN_HEIGHT+self.deleteDropZone.frame.size.height)
			},
			completion: {
				(value: Bool) in
				self.view.removeFromSuperview()
				self.removeFromParentViewController()
			})
	}
	
	func updateCanvasPreview(point: CGPoint) {
		println(point)
		canvasPreview.removeFromSuperview()
		canvasPreview.center = point
		self.view.addSubview(canvasPreview)
	}
	

}