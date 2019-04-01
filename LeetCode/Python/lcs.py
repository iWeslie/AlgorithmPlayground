def lcs(str1: str, str2: str) -> str:
    str1 = "Ø" + str1
    str2 = "Ø" + str2
    n = len(str1)
    m = len(str2)

    chess = [[0 for i in range(m)] for j in range(n)]

    for i in range(1, n):
        for j in range(1, m):
            if str1[i] == str2[j]:
                chess[i][j] = chess[i-1][j-1] + 1
            else:
                chess[i][j] = max(chess[i][j-1], chess[i-1][j])

    i = n - 1
    j = m - 1
    result = ""

    while i > 0 and j > 0:
        if str1[i] == str2[j]:
            result += str1[i]
            i -= 1
            j -= 1
        else:
            if chess[i][j-1] > chess[i-1][j]:
                j -= 1
            else:
                i -= 1
    return result[::-1]

lcs("ABCDBAB", "BDCABA")
