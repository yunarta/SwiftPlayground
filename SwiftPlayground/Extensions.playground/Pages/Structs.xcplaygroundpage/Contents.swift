//: Playground - noun: a place where people can play
//
// Demonstrate self retaining

import UIKit

public protocol Base { }
public protocol One { }
public protocol Two { }

protocol Worker {
    
//    func execute()
}

protocol One: Worker {
    
    //    func execute()
}

protocol Two: Worker {
    
    //    func execute()
}

public class Class<B>: NSObject, UITableViewDataSource where B: Base {

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("execute base")
        return UITableViewCell()
    }
}

extension Class where B where B == One {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("execute b")
        return UITableViewCell()
    }
}

extension Class where B where B == Two {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("execute c")
        return UITableViewCell()
    }
}

// class BaseOne: Base, One { }
// class BaseTwo: Base, Two { }

// var table = UITableView()

// var a = Class<BaseOne>()
// a.tableView(table, cellForRowAt: IndexPath(row: 0, section: 0))

// var b = Class<BaseTwo>()
// b.tableView(table, cellForRowAt: IndexPath(row: 0, section: 0))

// var c: UITableViewDataSource = Class<BaseTwo>()
// c.tableView(table, cellForRowAt: IndexPath(row: 0, section: 0))

