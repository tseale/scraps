
#import "SPOPDecayAnimation.h"

@implementation SPOPDecayAnimation

-(instancetype)init {
  self = [super init];
  self.ref = [POPDecayAnimation animation];
  return self;
}

-(SPOPDecayAnimation*)mutableCopy {
  return [[SPOPDecayAnimation alloc] initWithVelocity:[self.ref.velocity floatValue] decel:self.ref.deceleration];
}

-(instancetype)initWithVelocity:(CGFloat)velocity {
  return self = [[SPOPDecayAnimation alloc] initWithVelocity:velocity decel:self.deceleration];
}

-(instancetype)initWithVelocity:(CGFloat)velocity decel:(CGFloat)decel {
 self = [super init];
 self.ref = [POPDecayAnimation animation];
 self.ref.velocity = @(velocity);
 self.ref.deceleration = decel;
 return self;
}

- (id) velocity { return self.ref.velocity; }
- (void) setVelocity:(id)velocity { self.ref.velocity = velocity; }

- (CGFloat) deceleration { return self.ref.deceleration; }
- (void) setDeceleration:(CGFloat)deceleration { self.ref.deceleration = deceleration; }

- (CFTimeInterval) duration { return self.ref.duration; }

//- (id) reversedVelocity { return self.ref.reversedVelocity; }
//
//- (id) originalVelocity { return self.ref.originalVelocity; }

@end
