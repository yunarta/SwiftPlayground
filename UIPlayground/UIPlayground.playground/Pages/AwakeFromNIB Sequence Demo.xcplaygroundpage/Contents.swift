//: Playground - noun: a place where people can play
//
// Demonstrate that component assignment executed after awakeFromNIB

import UIKit
import UIPlayground
import PlaygroundSupport

let bootstrap = Bootstrap.self
let bundle = Bundle(for: bootstrap)
let storyboard = UIStoryboard(name: "Main", bundle: bundle)
let ui = storyboard.instantiateViewController(withIdentifier: "AwakeFromNIB")

PlaygroundPage.current.liveView = ui

