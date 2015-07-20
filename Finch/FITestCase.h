@class FISoundContext;

@interface FITestCase : XCTestCase

@property(strong, readonly) FISoundContext *soundContext;
@property(strong, readonly) NSBundle *soundBundle;

@end
