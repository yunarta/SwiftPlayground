//: Playground - noun: a place where people can play
// Demonstrate that NSRegularExpression need NSString length

import UIKit

let string = "🏳️🏴🏁"
string.count
(string as NSString).length

if let matcher = try? NSRegularExpression(pattern: "🏴", options: []) {
    // matches with Swift String API count
    let matches = matcher.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
    for match in matches {
        let char = string[String.Index(encodedOffset: match.range.lowerBound)...String.Index(encodedOffset: match.range.upperBound)]
        print(char)
    }
}

if let matcher = try? NSRegularExpression(pattern: "🏴", options: []) {
    // matches with ObjC NSString length
    let matches = matcher.matches(in: string, options: [], range: NSRange(location: 0, length: (string as NSString).length))
    for match in matches {
        let char = string[String.Index(encodedOffset: match.range.lowerBound)...String.Index(encodedOffset: match.range.upperBound)]
        print(char)
    }
}
