//
//  DynamicObject.m
//  Test
//
//  Created by sun on 5/10/24.
//

#import "DynamicObject.h"
#import <objc/runtime.h>
#import "Interceptor.h"
@implementation DynamicObject
// 动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)selector {
    if (selector == @selector(dynamicMethod)) {
        class_addMethod([self class], selector, (IMP)dynamicMethodImp, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:selector];
}

// 添加的动态方法实现
void dynamicMethodImp(id self, SEL _cmd) {
    NSLog(@"Dynamic method is called!");
}
- (void)processMessage {
    Interceptor *interceptor = [[Interceptor alloc] init];
    
    [interceptor interceptBefore]; // 在处理消息之前执行拦截器操作
    
    // 处理消息
    NSLog(@"Message is processed");
    
    [interceptor interceptAfter]; // 在处理消息之后执行拦截器操作
}
@end
