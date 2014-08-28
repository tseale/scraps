
#import "SPOPSpringAnimation.h"

@implementation SPOPSpringAnimation

-(instancetype)init {
  self = [super init];
  self.ref = [POPSpringAnimation animation];
  return self;
}

-(instancetype)initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass {
  self = [super init];
  self.ref = [POPSpringAnimation animation];
  self.ref.dynamicsTension = tension;
  self.ref.dynamicsFriction = friction;
  self.ref.dynamicsMass = mass;
  return self;
}

-(instancetype)initWithTension:(CGFloat)tension friction:(CGFloat)friction mass:(CGFloat)mass velocity:(CGFloat)velocity {
  self = [[SPOPSpringAnimation alloc] initWithTension:tension friction:friction mass:mass];
  self.ref.velocity = @(velocity);
  return self;
}

/// NB: Does not copy "velocity"
-(SPOPSpringAnimation *)mutableCopy {
  return [[SPOPSpringAnimation alloc] initWithTension:self.ref.dynamicsTension friction:self.ref.dynamicsFriction mass:self.ref.dynamicsMass];
}

-(CGFloat)springBounciness { return self.ref.springBounciness; }
-(void)setSpringBounciness:(CGFloat)springBounciness { self.ref.springBounciness = springBounciness; }

-(CGFloat)springSpeed { return self.ref.springSpeed; }
-(void)setSpringSpeed:(CGFloat)springSpeed { self.ref.springSpeed = springSpeed; }

-(CGFloat)dynamicsTension { return self.ref.dynamicsTension; }
-(void)setDynamicsTension:(CGFloat)dynamicsTension { self.ref.dynamicsTension = dynamicsTension; }

-(CGFloat)dynamicsFriction { return self.ref.dynamicsFriction; }
-(void)setDynamicsFriction:(CGFloat)dynamicsFriction { self.ref.dynamicsFriction = dynamicsFriction; }

-(CGFloat)dynamicsMass { return self.ref.dynamicsMass; }
-(void)setDynamicsMass:(CGFloat)dynamicsMass { self.ref.dynamicsMass = dynamicsMass; }

-(id)velocity { return self.ref.velocity; }
-(void)setVelocity:(id)velocity { self.ref.velocity = velocity; }

@end
