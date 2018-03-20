//: Playground - noun: a place where people can play

import UIKit
import UIPlayground
import PlaygroundSupport
 
let bootstrap = Bootstrap.self
let bundle = Bundle(for: bootstrap)
let storyboard = UIStoryboard(name: "Main", bundle: bundle)
let ui = storyboard.instantiateInitialViewController()

PlaygroundPage.current.liveView = ui
