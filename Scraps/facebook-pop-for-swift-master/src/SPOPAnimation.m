
#import "SPOPAnimation.h"

@implementation SPOPAnimation

+(void)addAnimation:(SPOPAnimation*)anim key:(NSString *)key obj:(id)obj {
  if (!obj || !key || !anim) return;
  [[POPAnimator sharedAnimator] addAnimation:anim.ref forObject:obj key:key];
}

+(void)removeAllAnimations:(id)obj {
  if (obj) [[POPAnimator sharedAnimator] removeAllAnimationsForObject:obj];
}

+(void)removeAnimationForKey:(NSString *)key obj:(id)obj {
  if (!obj || !key) return;
  [[POPAnimator sharedAnimator] removeAnimationForObject:obj key:key];
}

+(NSArray *)animationKeys:(id)obj {
  return obj ? [[POPAnimator sharedAnimator] animationKeysForObject:obj] : @[];
}

+(SPOPAnimation*)animationForKey:(NSString *)key obj:(id)obj {
  if (!obj || !key) return nil;
  SPOPAnimation* anim = [SPOPAnimation new];
  anim.ref = [[POPAnimator sharedAnimator] animationForObject:obj key:key];
  return anim;
}

// Must be overridden
-(SPOPAnimation *)mutableCopy { return nil; }

-(NSString *)name { return self.ref.name; }
-(void)setName:(NSString *)name { self.ref.name = name; }

@synthesize completionBlock = _completionBlock;
-(void (^)(SPOPAnimation *, BOOL))completionBlock { return _completionBlock; }
-(void)setCompletionBlock:(void (^)(SPOPAnimation *, BOOL))completionBlock {
  _completionBlock = completionBlock;
  SPOPAnimation* selfRef = self;
  self.ref.completionBlock = ^(POPAnimation* anim, BOOL finished){
    selfRef.completionBlock(selfRef, finished);
    selfRef.ref.completionBlock = nil;
  };
}

-(BOOL)removedOnCompletion { return self.ref.removedOnCompletion; }
-(void)setRemovedOnCompletion:(BOOL)removedOnCompletion { self.ref.removedOnCompletion = removedOnCompletion; }

-(BOOL)isPaused { return self.ref.isPaused; }
-(void)setPaused:(BOOL)paused { self.ref.paused = paused; }

//-(BOOL)autoreverses { return self.ref.autoreverses; }
//-(void)setAutoreverses:(BOOL)autoreverses { self.ref.autoreverses = autoreverses; }
//
//-(NSInteger)repeatCount { return self.ref.repeatCount; }
//-(void)setRepeatCount:(NSInteger)repeatCount { self.ref.repeatCount = repeatCount; }
//
//-(BOOL)repeatForever { return self.ref.repeatForever; }
//-(void)setRepeatForever:(BOOL)repeatForever { self.ref.repeatForever = repeatForever; }

@end
