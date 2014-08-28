
#import <POP/POP.h>
#import "SPOPPropertyAnimation.h"

@interface SPOPSpringAnimation : SPOPPropertyAnimation

- (instancetype) init;

- (instancetype) initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass;

- (instancetype) initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass velocity:(CGFloat)velocity;

- (SPOPSpringAnimation*) mutableCopy;

@property (copy, nonatomic)
id velocity;

@property (assign, nonatomic)
CGFloat springBounciness;

@property (assign, nonatomic)
CGFloat springSpeed;

@property (assign, nonatomic)
CGFloat dynamicsTension;

@property (assign, nonatomic)
CGFloat dynamicsFriction;

@property (assign, nonatomic)
CGFloat dynamicsMass;

@property (strong)
POPSpringAnimation* ref;

@end
