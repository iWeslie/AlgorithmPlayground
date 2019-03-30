def get_next(pattern: str) -> [int]:
    i = 0
    j = -1
    next = [0] * len(pattern)
    next[0] = -1

    while i < len(pattern) - 1:
        if j == -1 or pattern[i] == pattern[j]:
            i += 1
            j += 1
            next[i] = j
        else:
            j = next[j]
    return next


def kmp(text: str, pattern: str) -> int:
    next = get_next(pattern)
    i = j = 0

    while i < len(text) and j < len(pattern):
        if j == -1 or text[i] == pattern[j]:
            i += 1
            j += 1
        else:
            j = next[j]
    if j == len(pattern):
        return (i - j)
    return -1


get_next("ABCDABD")
kmp("BBC ABCDAB ABCDABCDABDE", "ABCDABD")
