#import "FITestCase.h"
#import "FISoundSource.h"
#import "FISampleBuffer.h"

@interface FISoundSourceTests : FITestCase
@end

@implementation FISoundSourceTests

- (void) testInitializationWithNilBuffer
{
    FISoundSource *source = nil;
    XCTAssertNoThrow(source = [[FISoundSource alloc] initWithSampleBuffer:nil error:NULL],
        @"Do not throw when creating a sound source with nil buffer");
    XCTAssertNil(source, @"Return a nil source for nil buffer");
}

- (void) testSoundProperties
{
    NSData *sampleData = [NSData dataWithContentsOfFile:[[self soundBundle] pathForResource:@"mono8bit" ofType:@"wav"]];
    FISampleBuffer *buffer = [[FISampleBuffer alloc] initWithData:sampleData sampleRate:44100 sampleFormat:FISampleFormatMono8 error:NULL];
    FISoundSource *source = [[FISoundSource alloc] initWithSampleBuffer:buffer error:NULL];

    XCTAssertEqual([source gain], 1.0f, @"Initial gain set to 1");
    XCTAssertEqual([source pitch], 1.0f, @"Initial pitch set to 1");
    XCTAssertEqual([source loop], NO, @"Do not loop by default");
    XCTAssertEqual([source isPlaying], NO, @"Not playing after init");

    [source play];
    XCTAssertEqual([source isPlaying], YES, @"Playing after calling -play");

    [source stop];
    XCTAssertEqual([source isPlaying], NO, @"Not playing after -stop");
}

@end
