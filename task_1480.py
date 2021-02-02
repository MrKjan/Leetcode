class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        ret = []
        sum = 0
        for num in nums:
            sum += num
            ret.append(sum)
        return ret
