
#import <Foundation/Foundation.h>
#import <POP/POP.h>

/// Abstract animation effect class
@interface SPOPAnimation : NSObject

+ (void) addAnimation:(SPOPAnimation*)anim key:(NSString*)key obj:(id)obj;

+ (void) removeAllAnimations:(id)obj;

+ (void) removeAnimationForKey:(NSString*)key obj:(id)obj;

+ (NSArray*) animationKeys:(id)obj;

+ (SPOPAnimation*) animationForKey:(NSString*)key obj:(id)obj;

- (SPOPAnimation*) mutableCopy;

@property (copy, nonatomic) NSString *name;

@property (assign, nonatomic) CFTimeInterval beginTime;

@property (weak, nonatomic) id delegate;

@property (readonly, nonatomic) POPAnimationTracer *tracer;

@property (copy, nonatomic) void (^completionBlock)(SPOPAnimation *anim, BOOL finished);

@property (assign, nonatomic) BOOL removedOnCompletion;

@property (assign, nonatomic, getter = isPaused) BOOL paused;

//@property (assign, nonatomic)
//BOOL autoreverses;
//
//@property (assign, nonatomic)
//NSInteger repeatCount;
//
//@property (assign, nonatomic)
//BOOL repeatForever;

@property (strong)
POPAnimation* ref;

@end

@interface POPAnimator (Swift)

- (void)addAnimation:(POPAnimation *)anim forObject:(id)obj key:(NSString *)key;

- (void)removeAllAnimationsForObject:(id)obj;

- (void)removeAnimationForObject:(id)obj key:(NSString *)key;

- (NSArray *)animationKeysForObject:(id)obj;

- (id)animationForObject:(id)obj key:(NSString *)key;

@end
