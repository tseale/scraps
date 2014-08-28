//
//  ScrapsOptionsMenuView.swift
//  Scraps
//
//  Created by Taylor Seale on 7/6/14.
//  Copyright (c) 2014 tseale. All rights reserved.
//

import Foundation
import UIKit

class ScrapsOptionsMenuView: UIView {
	
	let blurredBackground: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style:.Dark))
	
	let messageButton: UIButton = UIButton()
	let cancelButton: UIButton = UIButton()
	let deleteButton: UIButton = UIButton()
	
	func setFrame(frame: CGRect) {
		super.frame = frame
		blurredBackground.frame = self.bounds
		self.addSubview(blurredBackground)
		
		let buttonSize = CGSizeMake(60, 60)
		
		messageButton.center = CGPointMake(CGRectGetMidX(blurredBackground.frame)-100, CGRectGetMidY(blurredBackground.frame))
		messageButton.frame.size =  buttonSize
		let messageImage = UIImageView()
		let messageButtonImage = UIImage(named:"734-chat@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		messageImage.center = CGPointMake(messageButton.frame.size.width/2, messageButton.frame.size.height/2)
		messageImage.bounds.size = CGSizeMake(messageButtonImage.size.width,messageButtonImage.size.height)
		messageImage.image = messageButtonImage
		messageImage.tintColor = UIColor.whiteColor()
		messageButton.addSubview(messageImage)
		messageButton.layer.cornerRadius = (cancelButton.frame.size.width/2)
		messageButton.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.00)
		blurredBackground.contentView.addSubview(messageButton)
		
		cancelButton.center = CGPointMake(CGRectGetMidX(blurredBackground.frame), CGRectGetMidY(blurredBackground.frame))
		cancelButton.frame.size = buttonSize
		let cancelImage = UIImageView()
		let cancelButtonImage = UIImage(named:"709-plus@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		cancelImage.center = CGPointMake(cancelButton.frame.size.width/2, cancelButton.frame.size.height/2)
		cancelImage.bounds.size = CGSizeMake(cancelButtonImage.size.width,cancelButtonImage.size.height)
		cancelImage.image = cancelButtonImage
		cancelImage.tintColor = UIColor.whiteColor()
		//cancelImage.transform = CGAffineTransformMakeRotation(M_PI/4)
		cancelButton.addSubview(cancelImage)
		cancelButton.layer.cornerRadius = (cancelButton.frame.size.width/2)
		cancelButton.backgroundColor = UIColor.lightGrayColor()
		blurredBackground.contentView.addSubview(cancelButton)
		
		deleteButton.center = CGPointMake(CGRectGetMidX(blurredBackground.frame)+100, CGRectGetMidY(blurredBackground.frame))
		deleteButton.frame.size = buttonSize
		let deleteImage = UIImageView()
		let deleteButtonImage = UIImage(named:"711-trash@2x.png").imageWithRenderingMode(.AlwaysTemplate)
		deleteImage.center = CGPointMake(deleteButton.frame.size.width/2, deleteButton.frame.size.height/2)
		deleteImage.bounds.size = CGSizeMake(deleteButtonImage.size.width,deleteButtonImage.size.height)
		deleteImage.image = deleteButtonImage
		deleteImage.tintColor = UIColor.whiteColor()
		deleteButton.addSubview(deleteImage)
		deleteButton.layer.cornerRadius = (cancelButton.frame.size.width/2)
		deleteButton.backgroundColor = UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.00)
		blurredBackground.contentView.addSubview(deleteButton)
		
	}
}