//: [Previous](@previous)

import Foundation

//给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
//输入: 123
//输出: 321
//
//输入: -123
//输出: -321
//
//输入: 120
//输出: 21

//思路：
//1. 通过循环将数字的每一位拆开，在计算新值时判断是否有溢出
//      溢出条件有两个，一个是大于整数最大值MAX_VALUE，
//      另一个是小于整数最小值MIN_VALUE，设当前计算结果为ans，下一位为pop。
// 如果res * 10 + pop > Int.max, 那么就会溢出，
// 也就是当res > Int.max / 10 且pop还有值的时候，一定会溢出
// 当res == Int.max / 10 且pop大于Int.max % 10 的时候，也一定会溢出
// 同理 负数的情况

func reverse(_ x: Int) -> Int {
    var `x` = x
    var res = 0
    while x != 0 {
        let pop = x % 10
        x /= 10
        if res > Int32.max / 10  || (res == Int32.max / 10 && pop > 7) {
            return 0
        }
        if res < Int32.min / 10 || (res == Int32.min / 10 && pop < -8) {
            return 0
        }
        res = res * 10 + pop
    }
    
    return res
}


func reverse2(_ x: Int) -> Int {
    var `x` = x
    var res = 0
    while x != 0 {
        let pop = x % 10
        if res > Int.max / 10  || (res == Int.max / 10 && pop > Int.max % 10) {
            return 0
        }
        if res < Int.min / 10 || (res == Int.min / 10 && pop < Int.min % 10) {
            return 0
        }
        res = res * 10 + pop
        x /= 10
    }
    
    return res
}

reverse(1534236469)
reverse(-1223)
reverse(12230)

Int.max
Int.min % 10


//: [Next](@next)
