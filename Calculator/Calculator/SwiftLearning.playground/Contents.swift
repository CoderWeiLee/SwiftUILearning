import UIKit
let array = [1,3,5,7,9,10,11,12,13]
//for x in array.dropFirst() {
//    print(x) //舍弃最前面的一个，遍历其他
//}
//for x in array.dropLast(5) {
//    print(x) //舍弃最后面的5个，遍历其他
//}
//for (num, element) in array.enumerated() {
//    print(num, element)
//}

for (n, c) in "Swift".enumerated() {
    print("\(n),\(c)")
}
//let arr: ContiguousArray = [1,3,5,7,9]
//ContiguousArray中如果存放的是class或者@objc协议的，性能表现要好于Array,如果是结构体或者枚举，那么和Array相似

