
#import "SPOPCustomAnimation.h"

@implementation SPOPCustomAnimation

- (instancetype)init {
  self = [super init];
  self.ref = [POPCustomAnimation new];
  return self;
}

+(instancetype)animationWithBlock:(SPOPCustomAnimationBlock)block {
  SPOPCustomAnimation* anim = [SPOPCustomAnimation new];
  anim.ref = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
    anim.ref = animation;
    return block(target, anim);
  }];
  return anim;
}

-(CFTimeInterval)currentTime {
  return self.ref.currentTime;
}

-(CFTimeInterval)elapsedTime {
  return self.ref.elapsedTime;
}

@end
