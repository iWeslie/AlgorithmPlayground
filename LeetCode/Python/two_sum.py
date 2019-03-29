class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        dict = {}

        for i in range(len(nums)):
            result = target - nums[i]
            # index = dict[result]
            if result not in dict:
                dict[nums[i]] = i
            else:
                return([dict[result], i])
            dict[nums[i]] = i
        return [0, 0]


solution = Solution()
nums = [2, 7, 11, 15]
target = 9
solution.twoSum(nums, target)
