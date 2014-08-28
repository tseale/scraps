
#import "SPOPMutableAnimatableProperty.h"

@implementation SPOPMutableAnimatableProperty

-(void)setName:(NSString *)name { self.ref.name = name; }

-(void)setReadBlock:(void (^)(id, CGFloat *))readBlock { self.ref.readBlock = readBlock; }

-(void)setWriteBlock:(void (^)(id, const CGFloat *))writeBlock { self.ref.writeBlock = writeBlock; }

-(void)setThreshold:(CGFloat)threshold { self.ref.threshold = threshold; }

@end
