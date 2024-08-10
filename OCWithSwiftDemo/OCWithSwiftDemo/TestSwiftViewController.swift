//
//  TestSwiftViewController.swift
//  OCWithSwiftDemo
//
//  Created by sun on 6/5/24.
//

import UIKit
class TestSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift界面"
        let ocObject = MyOCClass()
        let dataFromObjC = ocObject.fetchData()
        print("Objective-C says: \(dataFromObjC)")
        
        ocObject.update(withData: "Data from Swift")
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        
    }
}


