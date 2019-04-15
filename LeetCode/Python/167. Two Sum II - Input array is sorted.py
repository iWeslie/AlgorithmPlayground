class Solution(object):
    # binary search
    def twoSum(self, numbers, target):
        """
        :type numbers: List[int]
        :type target: int
        :rtype: List[int]
        """
        for i in range(len(numbers)):
            l, r = i+1, len(numbers)-1
            tmp = target - numbers[i]
            # find tmp in right part
            while l < r:
                m = l + (r - l) // 2
                if numbers[m] < tmp:
                    l = m + 1
                elif numbers[m] > tmp:
                    r = m - 1
                elif numbers[m] == tmp:
                    return [i+1, m+1]

    # two pointer
    def twoSum(self, numbers, target):
        l, r = 0, len(numbers) - 1
        while l < r:
            s = numbers[l] + numbers[r]
            if s < target:
                # move l make bigger
                l += 1
            elif s > target:
                # move r make smaller
                r -= 1
            elif s == target:
                return [l+1, r+1]
