
#import <POP/POP.h>
#import "SPOPAnimatableProperty.h"

@interface SPOPMutableAnimatableProperty: SPOPAnimatableProperty

@property (readwrite, nonatomic, copy)
NSString *name;

@property (readwrite, nonatomic, copy)
void (^readBlock)(id obj, CGFloat values[]);

@property (readwrite, nonatomic, copy)
void (^writeBlock)(id obj, const CGFloat values[]);

@property (readwrite, nonatomic, assign)
CGFloat threshold;

@property (strong)
POPMutableAnimatableProperty* ref;

@end
