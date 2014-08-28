
import UIKit

@UIApplicationMain
class AppDelegate : NSObject, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]!) -> Bool {
    
    self.exampleSetup()
    self.exampleOne {
      self.exampleTwo {
        println("All examples completed!")
      }
    }
    
    return true
  }

  var circle: UIView!
  
  func exampleOne (done: () -> ()) {
    // An animation of a CALayer's opacity from 0 to 1
    let anim = POPBasicAnimation(duration: 3)
    anim.property = POPAnimatableProperty(name: kPOPLayerOpacity)
    anim.toValue = 1
    anim.completionBlock = { _, _ in done() }
    addAnimation(anim, anim.property.name, circle.layer)
  }
  
  func exampleTwo (done: () -> ()) {
    // Animate CALayer's size with a spring effect
    let anim = POPSpringAnimation(tension: 200, friction: 4, mass: 2)
    anim.property = POPAnimatableProperty(name: kPOPLayerSize)
    anim.toValue = NSValue(CGSize: CGSizeMake(200, 200))
    anim.completionBlock = { _, _ in done() }
    addAnimation(anim, anim.property.name, circle.layer)
    
    // Animate CALayer's cornerRadius with the same spring effect
    let anim2 = anim.mutableCopy()
    anim2.property = POPAnimatableProperty(name: kPOPLayerCornerRadius)
    anim2.toValue = 100
    addAnimation(anim2, anim2.property.name, circle.layer)
  }
  
  func exampleSetup () {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window!.rootViewController = UIViewController()
    window!.makeKeyAndVisible()
    
    circle = UIView(frame: CGRectMake(0, 0, 100, 100))
    circle.center = window!.center
    circle.backgroundColor = UIColor.blueColor()
    circle.layer.opacity = 0
    circle.layer.masksToBounds = true
    circle.layer.cornerRadius = 50
    window!.addSubview(circle)
  }
}