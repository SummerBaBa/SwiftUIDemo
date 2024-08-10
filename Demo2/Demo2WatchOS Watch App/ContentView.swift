//
//  ContentView.swift
//  Demo2WatchOS Watch App
//
//  Created by sun on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sessionDelegate = ExtensionDelegate()
    
    var body: some View {
        VStack {
            Text(sessionDelegate.receivedMessage)
                .padding()
            
            List(sessionDelegate.messages, id: \.self) { message in
                Text(message)
            }
            
            Button(action: sessionDelegate.sendMessageToiOS) {
                Text("Send Message to iOS")
            }
        }
    }
}
#Preview {
    ContentView()
}
