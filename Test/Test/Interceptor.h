//
//  Interceptor.h
//  Test
//
//  Created by sun on 5/10/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Interceptor : NSObject
- (void)interceptBefore;
- (void)interceptAfter;
@end

NS_ASSUME_NONNULL_END
