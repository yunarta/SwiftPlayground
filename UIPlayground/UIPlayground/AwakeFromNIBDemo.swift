//
//  AwakeFromNIBDemo.swift
//  UIPlayground
//
//  Created by Yunarta Kartawahyudi on 5/3/18.
//  Copyright © 2018 Mobile Solution Works. All rights reserved.
//

import Foundation

class AwakeFromNIBObject: NSObject {

    @IBOutlet weak var label: UILabel! {
        didSet {
            print("Object; label didSet()")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Object; awakeFromNIB()")
        print("Object; label = \(label)")
    }
}

class AwakeFromNIBDemo: UIViewController {

    @IBOutlet weak var label: UILabel! {
        didSet {
            print("UIViewController; label didSet()")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("UIViewController; awakeFromNIB()")
        print("UIViewController; label = \(label)")
    }
}
