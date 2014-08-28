
#import <POP/POP.h>
#import "SPOPAnimation.h"
#import "SPOPAnimatableProperty.h"

/// Property animation effect class
@interface SPOPPropertyAnimation : SPOPAnimation

- (SPOPPropertyAnimation*) mutableCopy;

@property (strong, nonatomic)
SPOPAnimatableProperty *property;

@property (copy, nonatomic)
id fromValue;

@property (copy, nonatomic)
id toValue;

@property (readonly)
CGFloat progress;

@property (assign, nonatomic)
CGFloat roundingFactor;

@property (assign, nonatomic)
NSUInteger clampMode;

@property (assign, nonatomic, getter = isAdditive)
BOOL additive;

@property (strong)
POPPropertyAnimation* ref;

@end
