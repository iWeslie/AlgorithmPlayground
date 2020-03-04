class Node:
    def __init__(self, data=None):
        self.data = data
        self.next = None


n1 = Node('eggs')
n2 = Node('ham')
n3 = Node('spam')
n1.next = n2
n2.next = n3

current = n1
while current:
    print(current.data)
    current = current.next
