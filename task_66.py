from typing import List


def to_int(arr):
    arr = arr[::-1]
    ret = 0
    for i, mul in zip(arr, range(len(arr))):
        ret += i * (10 ** mul)
    return ret

def to_arr(val):
    ret = []
    while val != 0:
        ret.append(val % 10)
        val = val // 10
    return ret[::-1]

class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        return to_arr(to_int(digits) + 1)

print(Solution().plusOne([9,9,9,9]))
