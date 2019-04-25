# Hash Table

1. Two Sum

136. Single Number

349. Intersection of Two Arrays

# Dynamic Programming

53. Maximum Subarray

==[Kadane's algorithm](https://en.wikipedia.org/wiki/Maximum_subarray_problem)== $\mathcal{O}(n),\mathcal{O}(1) $

```python
def max_subarray(A):
  prev = res = A[0]
  for x in A[1:]:
		prev = max(x, prev + x)
    res = max(res, prev)
	return res
```



let $maxSubArray = f​$ , array = $A​$

$f(A,i)​$ denotes the maximum subarray ending with $A[i]​$
$$
f(A,i)=A[i]+\left\{
  \begin{array}{c}
    f(A,i-1) & while\ f(A,i-1)>0\\
    0 & otherwise
  \end{array}
\right.
$$

70. Climbing Stairs

let $climbStairs = f​$ 

$f(i)$ denotes the number of ways to reach on $i^{th}$ step:
$$
f(i)=\left\{
  \begin{array}{c}
  	i & 0 \leq i \leq 3 \\
    f(i-1) + f(i-2) & i \geq 4\\
  \end{array}
\right.
\qquad
(i \in \mathbb{N})
$$
We can find $n^{th}$ fibonacci number using this formula:
$$
F_n = \frac{1}{\sqrt{5}}
\Bigg(
	\bigg(
		\frac{1+\sqrt5}{2}
	\bigg)^{n+1}
	-
	\bigg(
		\frac{1-\sqrt5}{2}
	\bigg)^{n+1}
\Bigg)
$$

118. Pascal's Triangle

Given $n$ rows in the triangle , $f(i,j)$ denotes the  $j^{th}$ element at $i^{th}​$ row


$$
\begin{array}{c}
  1\\
  1,1\\
  1,2,1\\
  1,3,3,1\\
 	1,4,6,4,1\\
 	1,5,10,10,5,1
\end{array} 
$$

$$
f(i,j)=\left\{
  \begin{array}{c}
  	1 & i=0\ or \ n-1 \\
    f(i-1,j-1) + f(i-1,j) & otherwise\\
  \end{array}
\right.
\qquad
(i \in [0,n-1])
$$

121. Best Time to Buy and Sell Stock

let $prices=A$
$$
maxCurrent = max\big(0, maxCurrent+(A[i]-A[i-1])\big)\\
maxSoFar=max(maxCurrent,maxSoFar)
$$


# Two Pointer

19. **Remove Nth Node From End of List**

# Binary Search

33. **Search in Rotated Sorted Array**
34. **Find First and Last Position of Element in Sorted Array**



# Tree

101. Symmetric Tree

105. Construct Binary Tree from Preorder and Inorder Traversal

110. Balanced Binary Tree

104. **Maximum Depth of Binary Tree**

```python
def maxDepth(self, root):
	if not root: return 0
  left, right = self.maxDepth(root.left), self.maxDepth(root.right)
  return 1 + max(left, right)
```

104. **Minimum Depth of Binary Tree**

```python
def minDepth(self, root):
  if not root: return 0
  left, right = self.minDepth(root.left), self.minDepth(root.right)
	return min(left, right) + 1 if left and right else left + right + 1
```

112. Path Sum(II)

# // TODO:-

24. Swap Nodes in Pairs
25. Permutations
26. **Validate Binary Search Tree**

112. Path Sum(II)

119. *Pascal's Triangle II*

