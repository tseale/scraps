//
//  ScrapsCanvasViewController.swift
//  Scraps
//
//  Created by Taylor Seale on 7/1/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsCanvasViewController: UIViewController {
	
	var canvasEditViewController: ScrapsCanvasEditViewController = ScrapsCanvasEditViewController()
	
	let canvasScrollView: UIScrollView = UIScrollView()
	
	let blurredBackground: UIVisualEffectView = UIVisualEffectView(effect:UIBlurEffect(style:.Dark))
	
	var canvasPreview: UIView = UIView()
	var originalCanvasCellFrame: CGRect = CGRect()
	
	var messageButton: UIButton = UIButton()
	var deleteButton: UIButton = UIButton()
	
	override func viewDidLoad() {
		self.view.frame = FULL_SCREEN
		blurredBackground.frame = FULL_SCREEN
		blurredBackground.alpha = 0.0
		self.view.addSubview(blurredBackground)
		
		canvasScrollView.frame = CGRectMake(0, 30, SCREEN_WIDTH, 2*SCREEN_HEIGHT/3)
		let scrollWidth = 2*SCREEN_WIDTH/6+(3*(2*SCREEN_WIDTH/3)+2*(SCREEN_WIDTH/12))
		canvasScrollView.contentSize = CGSizeMake(scrollWidth, 2*SCREEN_HEIGHT/3)
		canvasScrollView.contentOffset = CGPointMake(0, 0)
		canvasScrollView.pagingEnabled = true
		canvasScrollView.showsHorizontalScrollIndicator = false
		canvasScrollView.alpha = 0.0
		self.view.addSubview(canvasScrollView)
		
		let exitTap = UITapGestureRecognizer(target: self, action: "exitView")
		exitTap.numberOfTapsRequired = 1
		exitTap.numberOfTouchesRequired = 1
		blurredBackground.addGestureRecognizer(exitTap)
		
		self.canvasPreview.backgroundColor = UIColor.whiteColor()
		let editCanvasTap = UITapGestureRecognizer(target: self, action: "editCanvas")
		editCanvasTap.numberOfTapsRequired = 1
		editCanvasTap.numberOfTouchesRequired = 1
		canvasPreview.addGestureRecognizer(editCanvasTap)
		canvasPreview.userInteractionEnabled = true
		canvasPreview.layer.cornerRadius = 2
		self.view.addSubview(canvasPreview)
		
		messageButton.frame.size = CGSizeMake(70, 70)
		messageButton.center = CGPointMake(CGRectGetMidX(self.view.frame)-80, CGRectGetMaxY(self.view.frame)-80)
		messageButton.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.00)
		let messageImage = UIImageView()
		let messageButtonImage = UIImage(named:"734-chat@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		messageImage.center = CGPointMake(messageButton.frame.size.width/2, messageButton.frame.size.height/2)
		messageImage.bounds.size = CGSizeMake(messageButtonImage.size.width,messageButtonImage.size.height)
		messageImage.image = messageButtonImage
		messageImage.tintColor = UIColor.whiteColor()
		messageButton.addSubview(messageImage)
		messageButton.layer.cornerRadius = messageButton.frame.size.width/2
		messageButton.alpha = 0.0
		self.view.addSubview(messageButton)
		
		deleteButton.frame.size = CGSizeMake(70, 70)
		deleteButton.center = CGPointMake(CGRectGetMidX(self.view.frame)+80, CGRectGetMaxY(self.view.frame)-80)
		deleteButton.backgroundColor = UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.00)
		let deleteImage = UIImageView()
		let deleteButtonImage = UIImage(named:"711-trash@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		deleteImage.center = CGPointMake(35, 35)
		deleteImage.bounds.size = CGSizeMake(deleteButtonImage.size.width,deleteButtonImage.size.height)
		deleteImage.image = deleteButtonImage
		deleteImage.tintColor = UIColor.whiteColor()
		deleteButton.addSubview(deleteImage)
		deleteButton.layer.cornerRadius = 35
		deleteButton.alpha = 0.0
		self.view.addSubview(deleteButton)
		
	}
	
	func editCanvas() {
		UIView.animateWithDuration(0.3,
			delay: 0.0,
			options: nil,
			animations: {
				self.canvasPreview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
				self.messageButton.center = CGPointMake(CGRectGetMidX(self.view.frame)-80, CGRectGetMaxY(self.view.frame)+35)
				self.deleteButton.center = CGPointMake(CGRectGetMidX(self.view.frame)+80, CGRectGetMaxY(self.view.frame)+35)
			},
			completion: {(value: Bool) in})
	}
	
	func exitView() {
		UIView.animateWithDuration(0.1,
			delay: 0.0,
			options: nil,
			animations: {
				self.messageButton.alpha = 0.0
				self.deleteButton.alpha = 0.0
			},
			completion: {
				(value: Bool) in
				UIView.animateWithDuration(0.1,
					delay: 0.0,
					options: nil,
					animations: {
						self.canvasPreview.frame = self.originalCanvasCellFrame
						self.blurredBackground.alpha = 0.0
					},
					completion: {
						(value: Bool) in
						self.view.removeFromSuperview()
						self.removeFromParentViewController()
					})
			})
	}
	
	func transitionIntoOptionsView() {
		originalCanvasCellFrame = canvasPreview.frame
		UIView.animateWithDuration(0.3,
			delay: 0.0,
			options: nil,
			animations: {
				self.canvasPreview.frame = CGRectMake(SCREEN_WIDTH/6, 30, 2*SCREEN_WIDTH/3, 2*SCREEN_HEIGHT/3)
				self.blurredBackground.alpha = 1.0
			},
			completion: {
				(value: Bool) in
				UIView.animateWithDuration(0.1,
					delay: 0.0,
					options: nil,
					animations: {
						self.messageButton.alpha = 1.0
						self.deleteButton.alpha = 1.0
						self.canvasScrollView.alpha = 1.0
					},
					completion: {(value: Bool) in})
			})
	}
	
	func transitionIntoEditView() {
		originalCanvasCellFrame = canvasPreview.frame
		UIView.animateWithDuration(0.3,
			delay: 0.0,
			options: nil,
			animations: {
				self.canvasPreview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
				self.blurredBackground.alpha = 1.0
			},
			completion: {(value: Bool) in})
	}
}