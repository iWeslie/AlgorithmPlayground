class MyCircularQueue(object):

    def __init__(self, k):
        """
        Initialize your data structure here. Set the size of the queue to be k.
        :type k: int
        """
        self.size, self.k = 0, k
        self.head = self.tail = 0
        self.list = [None] * k

    def enQueue(self, value):
        """
        Insert an element into the circular queue. Return true if the operation is successful.
        :type value: int
        :rtype: bool
        """
        if not self.isFull():
            self.list[self.tail] = value
            self.tail = (self.tail + 1) % self.k
            self.size += 1
            return True
        return False

    def deQueue(self):
        """
        Delete an element from the circular queue. Return true if the operation is successful.
        :rtype: bool
        """
        if not self.isEmpty():
            self.head = (self.head + 1) % self.k
            self.size -= 1
            return True
        return False

    def Front(self):
        """
        Get the front item from the queue.
        :rtype: int
        """
        return self.list[self.head] if self.size else -1

    def Rear(self):
        """
        Get the last item from the queue.
        :rtype: int
        """
        return self.list[(self.tail + self.k-1) % self.k] if self.size else -1

    def isEmpty(self):
        """
        Checks whether the circular queue is empty or not.
        :rtype: bool
        """
        return True if not self.size else False

    def isFull(self):
        """
        Checks whether the circular queue is full or not.
        :rtype: bool
        """
        return True if self.size == self.k else False


# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue(k)
# param_1 = obj.enQueue(value)
# param_2 = obj.deQueue()
# param_3 = obj.Front()
# param_4 = obj.Rear()
# param_5 = obj.isEmpty()
# param_6 = obj.isFull()
