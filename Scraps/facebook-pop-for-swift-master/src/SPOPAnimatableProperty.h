
#import <Foundation/Foundation.h>
#import <POP/POP.h>

@class SPOPMutableAnimatableProperty;

@interface SPOPAnimatableProperty: NSObject

+ (SPOPAnimatableProperty*) propertyWithName:(NSString *)name;

+ (SPOPAnimatableProperty*) propertyWithName:(NSString *)name initializer:(void (^)(SPOPMutableAnimatableProperty* prop))block;

@property (readonly, nonatomic, copy)
NSString *name;

@property (readonly, nonatomic, copy)
void (^readBlock)(id obj, CGFloat values[]);

@property (readonly, nonatomic, copy)
void (^writeBlock)(id obj, const CGFloat values[]);

@property (readonly, nonatomic, assign)
CGFloat threshold;

@property (strong)
POPAnimatableProperty* ref;

@end
