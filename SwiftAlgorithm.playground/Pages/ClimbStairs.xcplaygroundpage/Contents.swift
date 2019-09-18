//: [Previous](@previous)

import Foundation

/// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
///
/// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
///
/// 注意：给定 n 是一个正整数。

/// 示例1
/// 输入： 2
/// 输出： 2
/// 解释： 有两种方法可以爬到楼顶。
/// 1.  1 阶 + 1 阶
/// 2.  2 阶

/// 示例2
/// 输入： 3
/// 输出： 3
/// 解释： 有三种方法可以爬到楼顶。
/// 1.  1 阶 + 1 阶 + 1 阶
/// 2.  1 阶 + 2 阶
/// 3.  2 阶 + 1 阶

/// 1. 暴力法
func climbStairs1(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    return climb_stairs1(0, n)
}

func climb_stairs1(_ i: Int, _ n: Int) -> Int {
    if i > n { return 0 }
    if i == n { return 1 }
    return climb_stairs1(i + 1, n) + climb_stairs1(i + 2, n)
}
print(climbStairs1(2))
print(climbStairs1(3))
print(climbStairs1(4))

/// 2.
func climbStairs2(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    
    var memo = Array(repeating: 0, count: n + 1)
    return climb_stairs2(0, n, memo: &memo)
}

func climb_stairs2(_ i: Int, _ n: Int, memo: inout [Int]) -> Int {
    if i > n { return 0 }
    if i == n { return 1 }
    if memo[i] > 0 {
        return memo[i]
    }
    memo[i] = climb_stairs2(i + 1, n, memo: &memo) + climb_stairs2(i + 2, n, memo: &memo)
    return memo[i]
}
print(climbStairs2(2))
print(climbStairs2(3))
print(climbStairs2(4))

/// 3
func climbStairs3(_ n: Int) -> Int {
    if n <= 3 {
        return n
    }
    var nums = [2, 3, 5]
    for _ in 4...n {
        nums[2] = nums[0] + nums[1]
        nums[0] = nums[1]
        nums[1] = nums[2]
    }
    return nums[2]
}

print(climbStairs3(2))
print(climbStairs3(3))
print(climbStairs3(4))


/// 4. 动态规划
func climbStairs4(_ n: Int) -> Int {
    if n <= 3 {
        return n
    }
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

print(climbStairs4(2))
print(climbStairs4(3))
print(climbStairs4(4))

//: [Next](@next)
