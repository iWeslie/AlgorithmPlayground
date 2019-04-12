def bitStr(n, s):
    if n == 1:
        return s
    return [
        digit + bits
        for digit in bitStr(1, s)
        for bits in bitStr(n - 1, s)
    ]

bitStr(3, 'abc')
