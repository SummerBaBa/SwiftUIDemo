import Foundation
import SwiftUI
//函数和闭包是引用类型
//计算型属性结构体、类、枚举都有，存储型属性只有类和结构体有
//属性监听只有存储型属性有。

struct ContentView: View {
    // State针对具体View的内部变量进行管理，不应该从外部被允许访问，所以应该标记为private
    @State private var count:Int = 0;
    
    var body: some View {
        VStack{
            Text("点击次数：\(count)")
            Button("点击按钮"){
                count = count+1
            }
        }
    }
}























