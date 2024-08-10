//
//  MySwiftClass.swift
//  OCWithSwiftDemo
//
//  Created by sun on 6/5/24.
//

import Foundation

@objcMembers
class MySwiftClass: NSObject {
    func fetchData() -> String {
        return "Data from Swift"
    }

    func update(with data: String) {
        print("Updated with data: \(data)")
    }
}

