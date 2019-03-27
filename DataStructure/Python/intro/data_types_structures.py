x = [1, 2, 3]
y = [1, 2, 3]
x == y
x is y
x = y
x is y

1 - 0.9
1 - 1

import decimal
x = decimal.Decimal(3.14)
y = decimal.Decimal(2.74)
x * y

decimal.getcontext().prec = 4
x * y


import fractions
fractions.Fraction(3, 4)
fractions.Fraction(0.5)
fractions.Fraction(".25")

tuple('sequence')

l = ['one', 'two']
x, y = l
x, y = y, x

d = {'one': 1, 'two': 2, 'three': 3}
d['four'] = 4
d.update({'five': 5, 'six': 6})
d
'five' in d


sorted(list(d))
sorted(list(d.values()))
sorted(list(d), key=d.__getitem__)
[value for (key, value) in sorted(d.items())]
sorted(list(d), key=d.__getitem__, reverse=True)

d2 = {'one': 'uno', 'two': 'deux', 'three': 'trois',
      'four': 'quatre', 'five': 'cinq', 'six': 'six'}

sorted(d2, key=d.__getitem__)
[d2[i] for i in sorted(d2, key=d.__getitem__)]


def corder(string):
    return(string[len(string) - 1])


sorted(d2.values(), key=corder)


# def wordcount(fname):
#     try:
#         fhand = open(fname)
#     except:
#         print('File cannot be opend')
#         exit()
#
#     count = dict()
#     for line in fhand:
#         words = line.split()
#         for word in words:
#             if word not in count:
#                 count[word] = 1
#             else:
#                 count[word] += 1
#     return(count)
#

# count = wordcount('alice.txt')
# filtered = {key: value for key, value in count.items()
#             if value < 20 and value > 15}
# filtered


s1 = {'ab', 3, 4, (5, 6)}
s2 = {'ab', 7, (7, 6)}
s1 - s2
s1.intersection(s2)
s1.union(s2)
'ab' in s1
'ab' not in s1
for element in s1:
    print(element)

# immutable
s1.add(frozenset(s2))
s1

fs1 = frozenset(s1)
fs2 = frozenset(s2)
{fs1: 'fs1', fs2: 'fs2'}
