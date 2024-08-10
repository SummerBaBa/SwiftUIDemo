// ViewController.m

#import "ViewController.h"
@import UserNotifications;
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UITextView *msgView;
@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize messages array
    self.messages = [NSMutableArray array];
    
    // Setup WatchConnectivity session
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    // 请求本地通知权限
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"本地通知权限已授予");
        } else {
            NSLog(@"本地通知权限被拒绝");
        }
    }];
    // 创建本地通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"本地通知标题";
    content.body = @"本地通知内容";
    content.sound = [UNNotificationSound defaultSound];
    
    // 创建触发器，设置通知在5秒后触发
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:61 repeats:YES];
    
    // 创建本地通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"localNotification" content:content trigger:trigger];
    
    // 将本地通知请求添加到通知中心
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"发送本地通知失败：%@", error);
        } else {
            NSLog(@"发送本地通知成功！");
        }
    }];
}

- (IBAction)sendMessageToWatch:(id)sender {
    if ([WCSession defaultSession].isReachable && self.messageTextField.text.length > 0) {
        NSDictionary *message = @{@"text": self.messageTextField.text,@"action": @"showText"};
        [[WCSession defaultSession] sendMessage:message
                                   replyHandler:nil
                                   errorHandler:^(NSError * _Nonnull error) {
            NSLog(@"Error sending message to Watch: %@", error);
        }];
        [self.messages addObject:self.messageTextField.text];
        NSString *str = @"";
        for(NSString *tmp in self.messages)
        {
            str = [str stringByAppendingString:tmp];
        }
        self.msgView.text = str;
        self.messageTextField.text = @"";
    }
}
- (IBAction)sendNotificationToWatch:(id)sender {
    if ([WCSession defaultSession].isReachable) {
            NSDictionary *message = @{@"action": @"showNotification"};
            [[WCSession defaultSession] sendMessage:message
                                       replyHandler:nil
                                       errorHandler:^(NSError * _Nonnull error) {
                NSLog(@"Error sending message to Watch: %@", error);
            }];
        }
}
#pragma mark - WCSessionDelegate

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message {
    NSString *text = message[@"text"];
    [self.messages addObject:text];
    NSString *str = @"";
    for(NSString *tmp in self.messages)
    {
        str = [str stringByAppendingString:tmp];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        self.msgView.text = str;
    });
}

- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error { 
    
}


- (void)sessionDidBecomeInactive:(nonnull WCSession *)session { 
    
}


- (void)sessionDidDeactivate:(nonnull WCSession *)session { 
    
}
@end


