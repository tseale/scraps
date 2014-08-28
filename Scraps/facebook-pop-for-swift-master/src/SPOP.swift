
public typealias POPAnimation = SPOPAnimation
public typealias POPPropertyAnimation = SPOPPropertyAnimation
public typealias POPBasicAnimation = SPOPBasicAnimation
public typealias POPDecayAnimation = SPOPDecayAnimation
public typealias POPSpringAnimation = SPOPSpringAnimation
public typealias POPCustomAnimation = SPOPCustomAnimation

public typealias POPAnimatableProperty = SPOPAnimatableProperty
public typealias POPMutableAnimatableProperty = SPOPMutableAnimatableProperty

public typealias POPAnimationTracer = SPOPAnimationTracer





/// Start & store `anim` as `key` for `obj`
public func addAnimation (anim: POPAnimation, key: String, obj: AnyObject) {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  POPAnimation.addAnimation(anim, key: key, obj: obj)
}

/// The names of all animations for `obj`
public func animationKeys (obj: AnyObject) -> [String] {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  return POPAnimation.animationKeys(obj) as [String]
}

/// The POPAnimation stored as `key` for `obj`
public func animationForKey (key: String, obj: AnyObject) -> POPAnimation {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  return POPAnimation(forKey: key, obj: obj)
}

/// Get all POPAnimations for `obj`
public func allAnimations (obj: AnyObject) -> [String:POPAnimation] {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  var anims = [String:POPAnimation]()
  for key in animationKeys(obj) {
    anims[key] = animationForKey(key, obj)
  }
  return anims
}

/// Destroy all POPAnimations for `obj`
public func removeAllAnimations (obj: AnyObject) {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  POPAnimation.removeAllAnimations(obj)
}

/// Destroy the POPAnimation stored as `key` for `obj`
public func removeAnimationForKey (key: String, obj: AnyObject) {
  if !(obj is NSObject) { fatalError("Facebook POP does not support Swift classes on its own") }
  POPAnimation.removeAnimationForKey(key, obj: obj)
}





// CALayer
public let kPOPLayerBackgroundColor = "backgroundColor"
public let kPOPLayerBounds = "bounds"
public let kPOPLayerCornerRadius = "cornerRadius"
public let kPOPLayerBorderWidth = "borderWidth"
public let kPOPLayerBorderColor = "borderColor"
public let kPOPLayerOpacity = "opacity"
public let kPOPLayerPosition = "position"
public let kPOPLayerPositionX = "positionX"
public let kPOPLayerPositionY = "positionY"
public let kPOPLayerRotation = "rotation"
public let kPOPLayerRotationX = "rotationX"
public let kPOPLayerRotationY = "rotationY"
public let kPOPLayerScaleX = "scaleX"
public let kPOPLayerScaleXY = "scaleXY"
public let kPOPLayerScaleY = "scaleY"
public let kPOPLayerSize = "size"
public let kPOPLayerSubscaleXY = "subscaleXY"
public let kPOPLayerSubtranslationX = "subtranslationX"
public let kPOPLayerSubtranslationXY = "subtranslationXY"
public let kPOPLayerSubtranslationY = "subtranslationY"
public let kPOPLayerSubtranslationZ = "subtranslationZ"
public let kPOPLayerTranslationX = "translationX"
public let kPOPLayerTranslationXY = "translationXY"
public let kPOPLayerTranslationY = "translationY"
public let kPOPLayerTranslationZ = "translationZ"
public let kPOPLayerZPosition = "zPosition"
public let kPOPLayerShadowColor = "shadowColor"
public let kPOPLayerShadowOffset = "shadowOffset"
public let kPOPLayerShadowOpacity = "shadowOpacity"
public let kPOPLayerShadowRadius = "shadowRadius"

// CAShapeLayer
public let kPOPShapeLayerStrokeStart = "shapeLayer.strokeStart"
public let kPOPShapeLayerStrokeEnd = "shapeLayer.strokeEnd"
public let kPOPShapeLayerStrokeColor = "shapeLayer.strokeColor"

// UIScrollView
public let kPOPScrollViewContentOffset = "scrollView.contentOffset"
public let kPOPScrollViewContentSize = "scrollView.contentSize"
public let kPOPScrollViewZoomScale = "scrollView.zoomScale"

// UILabel
public let kPOPLabelTextColor = "label.textColor"

// NSLayoutConstraint
public let kPOPLayoutConstraintConstant = "layoutConstraint.constant"

// UITableView
public let kPOPTableViewContentOffset = kPOPScrollViewContentOffset
public let kPOPTableViewContentSize = kPOPScrollViewContentSize

// UICollectionView
public let kPOPCollectionViewContentOffset = kPOPScrollViewContentOffset
public let kPOPCollectionViewContentSize = kPOPScrollViewContentSize

// UINavigationBar
public let kPOPNavigationBarBarTintColor = "navigationBar.barTintColor"

// UIToolbar
public let kPOPToolbarBarTintColor = kPOPNavigationBarBarTintColor

// UITabBar
public let kPOPTabBarBarTintColor = kPOPNavigationBarBarTintColor

// Thresholds
public let kPOPThresholdColor = 0.01
public let kPOPThresholdPoint = 1.0
public let kPOPThresholdScale = 0.005
public let kPOPThresholdOpacity = kPOPThresholdColor
public let kPOPThresholdRotation = kPOPThresholdColor
public let kPOPThresholdRadius = kPOPThresholdColor
