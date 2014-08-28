
#import "SPOPBasicAnimation.h"

@implementation SPOPBasicAnimation

-(instancetype)init {
  self = [super init];
  self.ref = [POPBasicAnimation animation];
  return self;
}

- (instancetype)initWithDuration:(CGFloat)duration timingFunction:(CAMediaTimingFunction *)timingFunction {
  self = [super init];
  self.ref = [POPBasicAnimation animation];
  self.ref.duration = duration;
  self.ref.timingFunction = timingFunction;
  return self;
}

-(instancetype)initWithDuration:(CGFloat)duration {
  return [[SPOPBasicAnimation alloc] initWithDuration:duration timingFunction:nil];
}

-(SPOPBasicAnimation *)mutableCopy {
  return [[SPOPBasicAnimation alloc] initWithDuration:self.ref.duration timingFunction:self.ref.timingFunction];
}

-(CFTimeInterval)duration { return self.ref.duration; }
-(CAMediaTimingFunction *)timingFunction { return self.ref.timingFunction; }

@end
