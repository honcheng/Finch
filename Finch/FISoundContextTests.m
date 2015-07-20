#import "FISoundContext.h"
#import "FISoundDevice.h"

@interface FISoundContextTests : XCTestCase
@end

@implementation FISoundContextTests

- (void) testContextCreation
{
    FISoundDevice *device = [FISoundDevice defaultSoundDevice];
    FISoundContext *context = [[FISoundContext alloc] initWithDevice:device error:NULL];
    XCTAssertNotNil(context, @"Create a context");
}

@end
