//
//  ViewController.m
//  OCWithSwiftDemo
//
//  Created by sun on 6/5/24.
//

#import "ViewController.h"
#import "MyOCClass.h"
#import "OCWithSwiftDemo-Swift.h" // 导入自动生成的Swift头文件,不是导入MySwiftClass文件
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MyOCClass *ocObject = [[MyOCClass alloc] init];
    [ocObject useSwiftClass];
    // Do any additional setup after loading the view.
}
- (IBAction)next:(id)sender {
    // 获取Storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; // 假设Storyboard名为"Main", 如果在其他Storyboard，请替换相应名字
    // 根据Storyboard ID实例化ViewController
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TestSwiftViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
