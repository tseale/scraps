
#import <Foundation/Foundation.h>
#import <POP/POP.h>
#import "SPOPPropertyAnimation.h"

@class SPOPCustomAnimation;

typedef BOOL (^SPOPCustomAnimationBlock)(id target, SPOPCustomAnimation *animation);

@interface SPOPCustomAnimation : SPOPAnimation

+ (instancetype)animationWithBlock:(SPOPCustomAnimationBlock)block;

@property (readonly, nonatomic)
CFTimeInterval currentTime;

@property (readonly, nonatomic)
CFTimeInterval elapsedTime;

@property (strong)
POPCustomAnimation* ref;

@end