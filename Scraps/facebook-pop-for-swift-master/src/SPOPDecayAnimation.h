
#import <POP/POP.h>
#import "SPOPPropertyAnimation.h"

@interface SPOPDecayAnimation : SPOPPropertyAnimation

- (instancetype) init;

-(instancetype)initWithVelocity:(CGFloat)velocity;

-(instancetype)initWithVelocity:(CGFloat)velocity decel:(CGFloat)decel;

-(SPOPDecayAnimation*)mutableCopy;

@property (copy, nonatomic)
id velocity;

//@property (copy, nonatomic, readonly)
//id originalVelocity;
//
//- (id)reversedVelocity;

@property (assign, nonatomic)
CGFloat deceleration;

@property (readonly, assign, nonatomic)
CFTimeInterval duration;

- (void)setToValue:(id)toValue NS_UNAVAILABLE;

@property (strong)
POPDecayAnimation* ref;

@end
