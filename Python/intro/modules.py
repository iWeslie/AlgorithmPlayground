# deque
from collections import deque
import itertools

dq = deque('abc')
dq
dq.append('d')
dq
dq.appendleft('z')
dq
dq.extend('efg')
dq
dq.extendleft('yxw')
dq
dq.pop()
dq.popleft()
dq
dq.rotate(2)
dq
dq.rotate(-2)
dq
list(itertools.islice(dq, 3, 9))

dq2 = deque([], maxlen=3)
for i in range(6):
    dq2.append(i)
    print(dq2)

# ChainMap
from collections import ChainMap
defaults = {'theme': 'Default', 'language': 'eng', 'showIndex': True, 'showFooter': True}
cm = ChainMap(defaults)
cm2 = cm.new_child({'theme': 'bluesky'})
cm
cm2
cm2['theme']
cm2.pop('theme')
cm2['theme']

cm2.maps[0] = {'theme': 'desert', 'showIndex': False}
cm2
cm2['showIndex']


# named tuples
from collections import defaultdict
dd = defaultdict(int)
words = str.split('red blue green red yellow blue red green green red')
for word in words:
    dd[word] += 1
dd

from collections import namedtuple
space = namedtuple('space', 'x y z')
s1 = space(x=2.0, y=4.0, z=10)
s1.x * s1.y * s1.z

space2 = namedtuple('space2', 'x def z', rename=True)
s1 = space2(3, 4, 5)
s1._1

sl = [4, 5, 6]
space._make(sl)


# array
import array
ba = array.array('i', range(10**6))
bl = list(range(10**6))
import sys
100 * sys.getsizeof(ba) / sys.getsizeof(bl)
