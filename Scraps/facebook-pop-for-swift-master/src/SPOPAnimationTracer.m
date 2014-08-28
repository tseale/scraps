
#import "SPOPAnimationTracer.h"

@implementation SPOPAnimationTracer

-(instancetype)init {
  self = [super init];
  self.ref = [POPAnimationTracer new];
  return self;
}

-(NSArray *)allEvents {
  return self.ref.allEvents;
}

-(NSArray *)writeEvents {
  return self.ref.writeEvents;
}

-(BOOL)shouldLogAndResetOnCompletion {
  return self.ref.shouldLogAndResetOnCompletion;
}

-(void)setShouldLogAndResetOnCompletion:(BOOL)shouldLogAndResetOnCompletion {
  self.ref.shouldLogAndResetOnCompletion = shouldLogAndResetOnCompletion;
}

-(void)start {
  [self.ref start];
}

-(void)stop {
  [self.ref stop];
}

-(void)reset {
  [self.ref reset];
}

-(NSArray *)eventsWithType:(POPAnimationEventType)type {
  NSLog(@"[SPOPAnimationTracer eventsWithType:] is not yet implemented");
  return nil;
}

@end