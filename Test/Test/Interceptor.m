//
//  Interceptor.m
//  Test
//
//  Created by sun on 5/10/24.
//

#import "Interceptor.h"

@implementation Interceptor
- (void)interceptBefore {
    NSLog(@"Interceptor: Before message processing");
}

- (void)interceptAfter {
    NSLog(@"Interceptor: After message processing");
}
@end
