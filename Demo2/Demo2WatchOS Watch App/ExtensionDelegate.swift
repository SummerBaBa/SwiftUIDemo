//
//  ExtensionDelegate.swift
//  Demo2WatchOS Watch App
//
//  Created by sun on 5/6/24.
//

import WatchKit
import WatchConnectivity
import UserNotifications

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate,ObservableObject {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    var session: WCSession
        
        @Published var receivedMessage: String = ""
        @Published var messages: [String] = []
        
        init(session: WCSession = .default) {
            self.session = session
            super.init()
            self.session.delegate = self
            self.session.activate()
        }
        
        func sendMessageToiOS() {
            if session.isReachable {
                let message = ["text": "Hello from Watch!"]
                session.sendMessage(message, replyHandler: nil) { error in
                    print("Error sending message to iOS: \(error)")
                }
            }
        }
        
        func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            guard let action = message["action"] as? String else { return }
                if action == "showNotification" {
                    print("收到通知")
                    // 请求通知权限
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                        if granted {
                            print("手表通知权限已授予")
                        } else {
                            print("手表通知权限被拒绝")
                        }
                    }
                    // 触发本地通知
                    let content = UNMutableNotificationContent()
                    content.title = "手表本地通知标题"
                    content.body = "手表本地通知内容"
                    content.sound = UNNotificationSound.default

                    // 创建触发器，设置通知在5秒后触发
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 61, repeats: true)

                    // 创建本地通知请求
                    let request = UNNotificationRequest(identifier: "localNotification", content: content, trigger: trigger)

                    // 将本地通知请求添加到通知中心
                    UNUserNotificationCenter.current().add(request) { (error) in
                        if let error = error {
                            print("手表发送本地通知失败：\(error)")
                        } else {
                            print("手表发送本地通知成功！")
                        }
                    }
                }
                else 
            {
                    DispatchQueue.main.async {
                        self.receivedMessage = message["text"] as? String ?? ""
                        self.messages.append(self.receivedMessage)
                    }
                    
                }
            
        }
}

