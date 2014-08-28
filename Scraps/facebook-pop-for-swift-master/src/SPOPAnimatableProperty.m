
#import "SPOPAnimatableProperty.h"
#import "SPOPMutableAnimatableProperty.h"

NSMutableDictionary* userCreatedProperties;

@implementation SPOPAnimatableProperty

+ (void)initialize {
  userCreatedProperties = [NSMutableDictionary dictionary];
}

+ (SPOPAnimatableProperty*) propertyWithName:(NSString *)name {
  SPOPAnimatableProperty* prop = [SPOPAnimatableProperty new];
  prop.ref = [POPAnimatableProperty propertyWithName:name];
  if (prop.ref == nil) prop.ref = userCreatedProperties[name];
  return prop.ref != nil ? prop : nil;
}

+ (SPOPAnimatableProperty*) propertyWithName:(NSString *)name initializer:(void (^)(SPOPMutableAnimatableProperty*))block {
  SPOPAnimatableProperty* prop = [SPOPAnimatableProperty new];
  prop.ref = [SPOPAnimatableProperty propertyWithName:name].ref;
  if (prop.ref == nil) {
    prop.ref = [POPAnimatableProperty propertyWithName:name initializer:^(POPMutableAnimatableProperty* _mprop){
      SPOPMutableAnimatableProperty* mprop = [SPOPMutableAnimatableProperty new];
      mprop.ref = _mprop;
      block(mprop);
    }];
    userCreatedProperties[name] = prop.ref;
  }
  return prop;
}

-(NSString *)name { return self.ref.name; }

-(void (^)(id, CGFloat *))readBlock { return self.ref.readBlock; }

-(void (^)(id, const CGFloat *))writeBlock { return  self.ref.writeBlock; }

-(CGFloat)threshold { return self.ref.threshold; }

@end
