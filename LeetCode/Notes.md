# Hash Table

1. Two Sum

136. Single Number

349. Intersection of Two Arrays

# Dynamic Programming

53. Maximum Subarray

let $maxSubArray = f$ , array = $A$

$f(A,i)$ denotes the maximum subarray ending with $A[i]$
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

# Two Pointer

19. ==Remove Nth Node From End of List==

# Binary Search

33. ==Search in Rotated Sorted Array==
34. ==Find First and Last Position of Element in Sorted Array==



# // TODO:-

24. Swap Nodes in Pairs

46. Permutations

98. Validate Binary Search Tree

