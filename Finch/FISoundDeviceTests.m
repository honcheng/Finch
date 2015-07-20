#import "FISoundDevice.h"

@interface FISoundDeviceTests : XCTestCase
@end

@implementation FISoundDeviceTests

- (void) testDefaultDeviceInitialization
{
    XCTAssertNotNil([FISoundDevice defaultSoundDevice], @"Get default sound device");
}

@end
