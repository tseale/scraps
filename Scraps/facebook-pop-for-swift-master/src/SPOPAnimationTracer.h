
#import <Foundation/Foundation.h>
#import <POP/POP.h>

@interface SPOPAnimationTracer : NSObject

- (instancetype) init;

- (void)start;

- (void)stop;

- (void)reset;

@property (nonatomic, assign, readonly)
NSArray *allEvents;

@property (nonatomic, assign, readonly)
NSArray *writeEvents;

- (NSArray *)eventsWithType:(POPAnimationEventType)type;

@property (nonatomic, assign)
BOOL shouldLogAndResetOnCompletion;

@property (strong)
POPAnimationTracer* ref;

@end
