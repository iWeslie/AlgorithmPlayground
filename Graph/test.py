import matplotlib.pyplot as plt
import random
import math
from typing import List

from dijkstra import point_connect

# https://blog.csdn.net/lnotime/article/details/82313355

def draw(pots: List[list], paths: List[list], l, h):
    """把点和路径画出来"""
    plt.figure(figsize=(10, 10))
    for a, b in paths:
        x = [pots[a][0], pots[b][0]]
        y = [pots[a][1], pots[b][1]]
        plt.plot(x, y, marker='o')
    plt.xticks(range(math.floor(l), math.ceil(h) + 1))
    plt.yticks(range(math.floor(l), math.ceil(h) + 1))
    plt.grid(linestyle='--')
    plt.savefig('pointTest.png')
    plt.show()


def _test():
    n = 200       # 数量
    l, h = -5, 5  # 范围上下限
    pots = set()
    while len(pots) < n:
        pots.add((random.uniform(l, h), random.uniform(l, h)))
    pots = list(map(list, pots))  # 点集
    # print(sorted(pots))

    paths, length_total = point_connect(pots)  # 求得路径
    print(paths)
    print(len(paths), length_total)
    draw(pots, paths, l, h)  # 画图查看


if __name__ == '__main__':
    _test()
