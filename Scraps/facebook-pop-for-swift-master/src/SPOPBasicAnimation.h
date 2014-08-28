
#import <POP/POP.h>
#import "SPOPPropertyAnimation.h"

@interface SPOPBasicAnimation : SPOPPropertyAnimation

- (instancetype) init;

- (instancetype) initWithDuration:(CGFloat)duration;

- (instancetype) initWithDuration:(CGFloat)duration timingFunction:(CAMediaTimingFunction*)timingFunction;

- (SPOPBasicAnimation*) mutableCopy;

@property (assign, nonatomic)
CFTimeInterval duration;

@property (strong, nonatomic)
CAMediaTimingFunction *timingFunction;

@property (strong)
POPBasicAnimation* ref;

@end
