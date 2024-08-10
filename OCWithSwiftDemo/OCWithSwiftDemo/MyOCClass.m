//
//  MyOCClass.m
//  OCWithSwiftDemo
//
//  Created by sun on 6/5/24.
//

#import "MyOCClass.h"
#import "OCWithSwiftDemo-Swift.h" // 导入自动生成的Swift头文件,不是导入MySwiftClass文件
@implementation MyOCClass
- (void)useSwiftClass {
    MySwiftClass *swiftObject = [[MySwiftClass alloc] init];
    NSString *data = [swiftObject fetchData];
    NSLog(@"Swift says: %@", data);
    [swiftObject updateWith:@"Data from Objective-C"];
}
- (NSString *)fetchData {
    return @"Data from Objective-C";
}

- (void)updateWithData:(NSString *)data {
    NSLog(@"Updated with data: %@", data);
}
@end
