a = 10
b = 20


def my_function():
    global a
    a = 11
    b = 21


my_function()
print(a)  # prints 11
print(b)  # prints 20


# Flow control and iteration
x = 'one'
if x == 0:
    print('False')
elif x == 1:
    print('True')
else:
    print('Something else')


x = 0
while x < 3:
    print(x)
    x += 1


# strings
greet = "hello world"
print(greet[1])
print(greet[0:8:2])
print(greet[0::2])
print(greet[1 + 2])
print(greet[len(greet) - 1])


for i in enumerate(greet[0:5]):
    print(i)

print(greet[:5] + ' wonderful' + greet[5:])


x = '3'
y = '2'
print("x + y: " + x + y)  # cocatenation
print(int(x) + int(y))  # addition


# lists

x = 1
y = 2
z = 3

list1 = [x, y, z]
list2 = list1
list2[1] = 4
print(list1)


items = [["rice", 2.4, 8], ["flour", 1.9, 5], ["Corn", 4.7, 6]]
for item in items:
    print("Product: %s, Price: %.2f, Quality: %i" % (item[0], item[1], item[2]))

items[1][1] *= 1.2
print(items[1][1])

l = [2, 4, 8, 16]
print([i ** 3 for i in l])


def f1(x): return x * 2
def f2(x): return x * 4


lst = []
for i in range(16):
    lst.append(f1(f2(i)))
print(lst)
print([f1(x) for x in range(64) if x in [f2(j) for j in range(16)]])

list1 = [[1, 2, 3], [4, 5, 6]]
print([i * j for i in list1[0] for j in list1[1]])

words = 'here is a sentence'.split()
print([[word, len(word)] for word in words])


# functions as first class objects
def greeting(language):
    if language == 'eng':
        return 'hello world'
    if language == 'fr':
        return 'Bonjour le monde'
    else:
        return 'language not supported'


l = [greeting('eng'), greeting('fr'), greeting('ger')]
print(l[1])


def callf(f):
    lang = 'eng'
    return (f(lang))


print(callf(greeting))


lst = [1, 2, 3, 4]
list1 = list(map(lambda x: x**3, lst))
print(list1)
list1 = list(filter(lambda x: x < 3, lst))
print(list1)

words = str.split('The longest word in this sentence')
sorted_words = sorted(words, key=len)
print(sorted_words)

sl = ['A', 'b', 'a', 'C', 'c']
sl.sort(key=str.lower)
print(sl)
sl.sort()
print(sl)

items.sort(key=lambda item: item[1])
print(items)


# Recursive
def iterTest(low, high):
    while low < high:
        print(low)
        low = low + 1


def recurTest(low, high):
    if low < high:
        print(low)
        recurTest(low+1, high)


# compares the running time of a list compared to a generator
import time
# generator function creates an iterator of odd numbers between n and m
def oddGen(n, m):
    while n < m:
        yield n
        n += 2


# builds a list of odd numbers between n and m
def oddLst(n, m):
    lst = []
    while n < m:
        lst.append(n)
        n += 2
    return lst


# the time it takes to perform sum on an iterator
t1 = time.time()
sum(oddGen(1, 1000000))
print("Time to sum an iterator: %f" % (time.time() - t1))

# the time it takes to build and sum a list
t1 = time.time()
sum(oddLst(1, 1000000))
print("Time to build and sum a list: %f" % (time.time() - t1))

lst1 = [1, 2, 3, 4]
gen1 = (10**i for i in lst1)
print(gen1)


# CLassed and object programming
class Employee(object):
    numEmployee = 0

    def __init__(self, name, rate):
        self.owed = 0
        self.name = name
        self.rate = rate
        Employee.numEmployee += 1

    def __del__(self):
        Employee.numEmployee -= 1

    def hours(self, numHours):
        self.owed += numHours * self.rate
        return ("%.2f hours worked" % numHours)

    def pay(self):
        self.owed = 0
        return("payed %s " % self.name)


emp1 = Employee("Jill", 18.50)
emp2 = Employee("Jack", 15.50)

print(Employee.numEmployee)
print(emp1.hours(20))
print(emp1.owed)
print(emp1.pay())


# Special methods
class my_class():
    def __init__(self, greet):
        self.greet = greet

    def __repr__(self):
        return 'a custom object (%r)' % (self.greet)


a = my_class('giday')
print(a)


# Inheritance
class SpecialEmployee(Employee):
    def __init__(self, name, rate, bounds):
        Employee.__init__(self, name, rate)
        self.bounds = bounds

    def hours(self, numHours):
        self.owed += numHours * self.rate * 2 + self.bounds
        return("%.2f hours worked" % numHours)


class Aepx(object):
    base = 2

    @classmethod
    def exp(cls, x):
        return(cls.base**x)
