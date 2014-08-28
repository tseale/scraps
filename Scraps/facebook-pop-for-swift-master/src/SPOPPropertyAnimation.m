
#import "SPOPPropertyAnimation.h"

@implementation SPOPPropertyAnimation

// FIXME: mutableCopy() always returns nil
- (SPOPPropertyAnimation*) mutableCopy { return nil; }

@synthesize property = _property;
-(SPOPAnimatableProperty *)property { return _property; }
-(void)setProperty:(SPOPAnimatableProperty *)property {
  _property = property;
  self.ref.property = property.ref;
}

-(id)fromValue { return self.ref.fromValue; }
-(void)setFromValue:(id)fromValue { self.ref.fromValue = fromValue; }

-(id)toValue { return self.ref.toValue; }
-(void)setToValue:(id)toValue { self.ref.toValue = toValue; }

-(CGFloat)roundingFactor { return self.ref.roundingFactor; }
-(void)setRoundingFactor:(CGFloat)roundingFactor { self.ref.roundingFactor = roundingFactor; }

-(NSUInteger)clampMode { return self.ref.clampMode; }
-(void)setClampMode:(NSUInteger)clampMode { self.ref.clampMode = clampMode; }

-(BOOL)isAdditive { return self.ref.isAdditive; }
-(void)setAdditive:(BOOL)additive { self.ref.additive = additive; }

@end
