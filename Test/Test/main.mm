//
//  main.m
//  Test
//
//  Created by sun on 5/10/24.
//

#import <Foundation/Foundation.h>
#import "Interceptor.h"
#import "DynamicObject.h"
#import <objc/runtime.h>
// 实现动态添加的方法
void dynamicMethodImp1(id self, SEL _cmd) {
    NSLog(@"Dynamic method added to the class!");
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 动态创建一个新的类
        Class dynamicClass = objc_allocateClassPair([NSObject class], "DynamicClass", 0);
        // 添加一个名为 dynamicMethod 的方法
        class_addMethod(dynamicClass, @selector(dynamicMethod1), (IMP)dynamicMethodImp1, "v@:");
        // 注册这个类
        objc_registerClassPair(dynamicClass);
        
        // 创建一个实例并调用动态添加的方法
        id instance = [[dynamicClass alloc] init];
        [instance performSelector:@selector(dynamicMethod1)];
    }
    return 0;
}
