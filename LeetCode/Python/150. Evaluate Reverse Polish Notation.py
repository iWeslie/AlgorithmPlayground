class Solution(object):
    def evalRPN(self, tokens):
        """
        :type tokens: List[str]
        :rtype: int
        """
        s = []
        for c in tokens:
            if c in "+-*/":
                b, a = s.pop(), s.pop()
                if c == "+":
                    s.append(a + b)
                elif c == "-":
                    s.append(a - b)
                elif c == "*":
                    s.append(a * b)
                elif c == "/":
                    if a * b < 0 and a % b != 0:
                        s.append(a / b + 1)
                    else:
                        s.append(a / b)
            else:
                s.append(int(c))
        return s.pop()
