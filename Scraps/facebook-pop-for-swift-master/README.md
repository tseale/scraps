##Facebook POP for Swift

**What is this?** A wrapper for [Facebook POP](https://github.com/facebook/pop) written in Objective-C (whereas POP is written in Objective-C++)

**Why would I need this?** [Objective-C++ can't be imported into Swift](http://stackoverflow.com/a/24042893/2228559), as of July 28 2014.

--

####Simple example

Everything should work as expected. This is how you can create a new animation:

````Swift
  let anim = POPSpringAnimation(tension: 100, friction: 10, mass: 1)
  anim.property = POPAnimatableProperty(name: kPOPLayerOpacity)
  anim.toValue = 0
  addAnimation(anim, anim.property.name, view.layer)
````

Check out the [**Example**](https://github.com/aleclarson/facebook-pop-for-swift/tree/master/Example) folder to see it in action.

--

####Install

Add `#import "SPOP.h"` to the **.h** file pointed to under *Build Settings -> Swift Compiler - Code Generation -> Objective-C Bridging Header*.

--

####Swift classes

I didn't wrap *every* POP class, as you will see. Here's a list of what I wrapped:

- POPAnimation
- POPPropertyAnimation
- POPSpringAnimation
- POPBasicAnimation
- POPDecayAnimation
- POPCustomAnimation
- POPAnimatableProperty
- POPMutableAnimatableProperty
- POPAnimationTracer
 
--

####Global functions

POP normally provides an `NSObject` category for associating `POPAnimation`s with their targets. Because this is Swift territory (and because I want to support Swift classes eventually), I opted for some global functions. Hopefully, you don't mind! :smile:

````Swift
func addAnimation(POPAnimation, String, AnyObject) -> Void
addAnimation(anim, kPOPLayerOpacity, view.layer) // how to use

func addAnimation(POPAnimation, String, AnyObject) -> Void
removeAllAnimations(view.layer) // how to use

func removeAnimationForKey(String, AnyObject) -> Void
removeAnimationForKey(kPOPLayerOpacity, view.layer) // how to use

func animationKeys(AnyObject) -> [String]
let keys = animationKeys(view.layer) // how to use

func animationForKey(String, AnyObject) -> POPAnimation
let anim = animationForKey(kPOPLayerOpacity, view.layer) // how to use
````

--

####Convenience initializers

I added some convenience initializers to `POPSpringAnimation`, `POPBasicAnimation`,  and `POPDecayAnimation`. I implemented `- (id) mutableCopy {}` in these three, as well! Enjoy, or take them out!

**POPSpringAnimation**

````Objective-C
- (instancetype) initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass;
- (instancetype) initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass velocity:(CGFloat)velocity;
````

*...use like this...*

````Swift
var anim = POPSpringAnimation(tension: 100, friction: 10, mass: 1)
var anim = POPSpringAnimation(tension: 100, friction: 10, mass: 1, velocity: 1000)
````

**POPDecayAnimation**

````Objective-C
-(instancetype)initWithVelocity:(CGFloat)velocity;
-(instancetype)initWithVelocity:(CGFloat)velocity decel:(CGFloat)decel;
````

*...use like this...*

````Swift
var anim = POPDecayAnimation(velocity: 1000)
var anim = POPDecayAnimation(velocity: 1000, decel: 0.995)
````

**POPBasicAnimation**

````Objective-C
- (instancetype) initWithDuration:(CGFloat)duration;
- (instancetype) initWithDuration:(CGFloat)duration timingFunction:(CAMediaTimingFunction*)timingFunction;
````

*...use like this...*

````Swift
var anim = POPBasicAnimation(duration: 1)
var anim = POPBasicAnimation(duration: 1, timingFunction: CAMediaTimingFunction(controlPoints: 0, 0, 1, 1))
````

--

####SPOP.swift

What is this file for?

- Redefines POP's preset property keys as constant `String`s (eg: `let kPOPLayerBounds = "bounds"`).

- Defines `POPAnimation`'s class methods as global functions

- Defines typealiases for all `SPOP...` classes, allowing normal use of `POP...` names. (In other words, `SPOPBasicAnimation` is the same as `POPBasicAnimation`)

--

####Changelog

**Tuesday, July 29, 2014**

- Custom `POPAnimatableProperty`s are now retained automatically. Just call `POPAnimatableProperty.propertyNamed("myProp", initializer: {})` without using its return value and you're good to go!

**Monday, July 28, 2014**

- Changed class name prefix from `_POP` to `SPOP`.

- Created `typealias`es so you can use the classes normally (eg `POPBasicAnimation`!!!).

- `POPMutableAnimatableProperty` is now a subclass of `POPAnimatableProperty`

- Added `POPAnimationTracer` and `POPCustomAnimation`

- Added the rest of the preset property keys (eg: `kPOPTabBarBarTintColor` is now available)

- You can use `POPSpringAnimation()`, `POPDecayAnimation()`, `POPBasicAnimation()`, and `POPCustomAnimation()` without any arguments

- The `POPAnimation` class methods are now available as global functions! Plus `fatalError()` is called when a non-`NSObject` is used, since POP doesn't support Swift classes on its own.

--

Created by **Alec Larson** (@aleclarsoniv)
