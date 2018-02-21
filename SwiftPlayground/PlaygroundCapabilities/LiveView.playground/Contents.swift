//: A UIKit based Playground for presenting user interface
//
// Playgound live view feature
// Live view is accessible in Assistant Editor
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let button = UIButton()
        button.frame = CGRect(x: 80, y: 200, width: 200, height: 20)
        button.setTitle("Button", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(MyViewController.onClick), for: UIControlEvents.touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc func onClick() {
        print("on click")
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
