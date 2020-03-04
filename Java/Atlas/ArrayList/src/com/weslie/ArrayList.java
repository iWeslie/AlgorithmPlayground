package com.weslie;

/**
 * ArrayList
 */
@SuppressWarnings("unchecked")
public class ArrayList<E> {

    /**
     * elements count
     */
    private int size;

    /**
     * all elements
     */
    private E[] elements;

    private static final int DEFAULT_CAPCITY = 10;
    private static final int ELEMENT_NOT_FOUND = -1;

    public ArrayList(int capacity) {
        if (capacity < DEFAULT_CAPCITY) 
            capacity = DEFAULT_CAPCITY;
        elements = (E[]) new Object[capacity];
    }

    public ArrayList() {
        this(DEFAULT_CAPCITY);
    }

    /**
     * remove all elements
     */
    public void clear() {
        // TODO: - remove pointers
        for (int i = 0; i < size; i++) {
            elements[i] = null;
        }
        size = 0;
    }

    /**
     * count of elements
     */
    public int size() {
        return size;
    }

    /**
     * return whether the array is empty
     */
    public boolean isEmpty() {
        return size == 0;
    }

    /**
     * return whether the array contain an element
     */
    public boolean contains(E element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /**
     * return the i-th index element
     */
    public E get(int index) {
        checkRange(index);
        return elements[index];
    }

    /**
     * set the i-th index element 
     */
    public E set(int index, E element) {
        checkRange(index);
        E oldElement = elements[index];
        elements[index] = element;
        return oldElement;
    }

    private void ensureCapcity(int capacity) {

        int oldCapcity = elements.length;
        if (oldCapcity >= capacity) return;

        // grow
        int newCapcity = oldCapcity + (oldCapcity >> 1);
        E[] newElements = (E[]) new Object[newCapcity];
        for (int i = 0; i < size; i++) {
            newElements[i] = elements[i];
        }
        elements = newElements;

        System.out.println("Growed from " + oldCapcity + " to " + newCapcity);
    }

    /**
     * insert an element at i
     */
    public void add(int index, E element) {

        checkRange(index);

        // TODO: - make sure capcity >= size + 1
        ensureCapcity(size + 1);

        for (int i = size; i > index; i--) {
            elements[i] = elements[i - 1];
        }

        elements[index] = element;
        size++;
    }

    /**
     * append an element
     */
    public void add(E element) {
        add(size, element);
    }

    /**
     * remove an element at i
     */
    public E remove(int index) {
        checkRange(index);
        E removing = elements[index];

        for (int i = index; i < size - 1; i++) {
            elements[i] = elements[i + 1];
        }

        return removing;
    }

    /**
     * return the first index of an element
     */
    public int indexOf(E element) {
        if (element == null) {
            for (int i = 0; i < size; i++) {
                if (elements[i] == null) return i;
            }
        } else {
            for (int i = 0; i < size; i++) {
                if (element.equals(elements[i])) return i;
            }
        }
        return ELEMENT_NOT_FOUND;
    }

    private void checkRange(int index) {
        // check the bounds
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index of of bounds");
        }
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("size: " + size + ", ");
        builder.append("[");
        for (int i = 0; i < size(); i++) {
            if (i != size - 1) {
                builder.append(i).append(", ");
            }
        }
        builder.append("]");

        return builder.toString();
    }

}