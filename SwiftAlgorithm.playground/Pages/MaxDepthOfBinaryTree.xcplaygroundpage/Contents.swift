//: [Previous](@previous)

import Foundation
//给定一个二叉树，找出其最大深度。
//
//二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
//
//说明: 叶子节点是指没有子节点的节点。
//
//示例：
//给定二叉树 [3,9,20,null,null,15,7]，
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回它的最大深度 3
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func maxDepth(_ root: TreeNode?) -> Int {
    
    var stack = [(Int, TreeNode?)]()
    guard let root = root else { return 0 }
    stack.append((1, root))
    var depth = 0
    while !stack.isEmpty {
        let (currentDepth, root) = stack.popLast()!
        if root != nil {
            depth = max(depth, currentDepth)
            stack.append((currentDepth + 1, root?.left))
            stack.append((currentDepth + 1, root?.right))
        }
    }
    return depth
}


//: [Next](@next)
